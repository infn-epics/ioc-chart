# ioc-chart/templates/_helpers.tpl
{{- define "ioc-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "ioc-chart.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end -}}
{{- define "ioc-chart.name" -}}
{{- .Chart.Name }}
{{- end -}}
{{- define "ioc-chart.release" -}}
{{- .Release.Name }}
{{- end -}}

{{/*
Generate an IP address from a string name.
*/}}
{{/*
Generate an IP address from a string name.
*/}}
{{/*
Generate an IP address from a string name.
*/}}
{{- define "allocateIpFromName" -}}
{{- $name := printf "%s.%s" .Release.Name .Release.Namespace -}}
{{- $baseIp := .Values.baseIp -}}
{{- $startIp := .Values.startIp | int -}}
{{- $ipRange := .Values.ipRange | int -}}
{{- $debug := "" -}}
{{- $conversion := atoi (adler32sum $name) -}}
{{- $ipSuffix := add $startIp (mod $conversion $ipRange) -}}
{{- $thirdOctet := div $ipSuffix 256 -}}
{{- $fourthOctet := mod $ipSuffix 256 -}}
{{- printf "%s.%d.%d" $baseIp $thirdOctet $fourthOctet -}}
{{- end -}}





{{- define "ioc-chart.labels" -}}
helm.sh/chart: {{ include "ioc-chart.chart" . }}
{{ include "ioc-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.ioc_version }}
ioc_version: {{ .Values.ioc_version | quote }}
{{- end }}
{{- end }}


{{- define "ioc-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ioc-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
beamline: {{ .Values.beamline | quote }}
{{- end }}