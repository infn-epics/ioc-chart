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