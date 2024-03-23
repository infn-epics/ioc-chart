# ioc-chart/templates/_helpers.tpl
{{- define "ioc-chart.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end -}}
{{- define "ioc-chart.name" -}}
{{- .Chart.Name }}
{{- end -}}
{{- define "ioc-chart.release" -}}
{{- .Release.Name }}
{{- end -}}

{{- define "ioc-chart.labels" -}}
helm.sh/chart: {{ include "ioc-chart.chart" . }}
{{ include "ioc-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

ioc_version: {{ .Values.ioc_version | quote }}


{{- define "ioc-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ioc-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
beamline: {{ .Values.beamline | quote }}

{{- end }}