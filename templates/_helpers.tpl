# ioc-chart-chart/templates/_helpers.tpl
{{- define "ioc-chart-chart.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end -}}
{{- define "ioc-chart-chart.name" -}}
{{- .Chart.Name }}
{{- end -}}
{{- define "ioc-chart-chart.release" -}}
{{- .Release.Name }}
{{- end -}}