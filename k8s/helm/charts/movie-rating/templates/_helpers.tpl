{{- define "movie-rating.app.secret-name" -}}
{{ .Chart.Name }}-secrets
{{- end }}

{{- define "movie-rating.local.db-address" -}}
{{ .Release.Name }}-postgresql
{{- end }}

{{- define "movie-rating.app.name" -}}
{{ .Chart.Name }}-api
{{- end }}

{{- define "movie-rating.migration.secret-name" -}}
{{ .Chart.Name }}-migration-secrets
{{- end }}

{{- define "movie-rating.secret-store.name" -}}
{{ .Release.Name }}-secret-store
{{- end }}
