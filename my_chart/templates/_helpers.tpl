{{/*
Generate the full name of the release.
*/}}
{{- define "mariadb.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Generate labels for the deployment.
*/}}
{{- define "mariadb.labels" -}}
app.kubernetes.io/name: mariadb
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Generate selector labels for the deployment.
*/}}
{{- define "mariadb.selectorLabels" -}}
{{- dict "app" (include "mariadb.fullname" .) | toYaml }}
{{- end -}}
