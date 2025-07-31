{{/*
Expand the name of the chart.
Always uses .Release.Name instead of .Chart.Name.
*/}}
{{- define "paxel.name" -}}
{{- if .Values.nameOverride }}
{{- .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name.
Always uses .Release.Name without appending chart name.
*/}}
{{- define "paxel.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "paxel.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "paxel.labels" -}}
helm.sh/chart: {{ include "paxel.chart" . }}
{{ include "paxel.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Values.image.tag }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/deployment-time: "{{ now | mustDateModify "+7h" | date "2006-01-02T15_04_05" }}"
{{- end }}

{{/*
Selector labels
*/}}
{{- define "paxel.selectorLabels" -}}
app.kubernetes.io/name: {{ include "paxel.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "paxel.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "paxel.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
