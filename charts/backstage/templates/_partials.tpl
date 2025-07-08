{{- define "orchestrator.plugins" }}
{{- $config := include "orchestrator.plugins.config" . | fromYaml  }}
plugins:
  - disabled: false
    package: "{{ $config.orchestratorPlugins.scope }}/{{ $config.orchestratorPlugins.orchestratorBackend.package }}"
    integrity: "{{ $config.orchestratorPlugins.orchestratorBackend.integrity }}"
    pluginConfig:
      orchestrator:
        dataIndexService:
          url: http://sonataflow-platform-data-index-service.{{ .Release.Namespace }}
  - disabled: false
    package: "{{ $config.orchestratorPlugins.scope }}/{{ $config.orchestratorPlugins.orchestrator.package }}"
    integrity: "{{ $config.orchestratorPlugins.orchestrator.integrity }}"
    pluginConfig:
      dynamicPlugins:
        frontend:
          red-hat-developer-hub.backstage-plugin-orchestrator:
            appIcons:
              - importName: OrchestratorIcon
                name: orchestratorIcon
            dynamicRoutes:
              - importName: OrchestratorPage
                menuItem:
                  icon: orchestratorIcon
                  text: Orchestrator
                path: /orchestrator
  - disabled: false
    package: "{{ $config.orchestratorPlugins.scope }}/{{ $config.orchestratorPlugins.scaffolderBackendOrchestrator.package }}"
    integrity: "{{ $config.orchestratorPlugins.scaffolderBackendOrchestrator.integrity }}"
    pluginConfig:
      orchestrator:
        dataIndexService:
          url: http://sonataflow-platform-data-index-service.{{ .Release.Namespace }}
  - disabled: false
    package: "{{ $config.orchestratorPlugins.scope }}/{{ $config.orchestratorPlugins.orchestratorFormWidgets.package }}"
    integrity: "{{ $config.orchestratorPlugins.orchestratorFormWidgets.integrity }}"
    pluginConfig:
      dynamicPlugins:
        frontend:
          red-hat-developer-hub.backstage-plugin-orchestrator-form-widgets: {}
{{- end }}
{{- define "orchestrator.plugins.config" }}
orchestratorPlugins: 
    scope: "oci:/"
    orchestrator:
      package: "ghcr.io/redhat-developer/rhdh-plugin-export-overlays/red-hat-developer-hub-backstage-plugin-orchestrator:pr_1214__3.1.3!red-hat-developer-hub-backstage-plugin-orchestrator"
      integrity: sha512-fOSJv2PgtD2urKwBM7p9W6gV/0UIHSf4pkZ9V/wQO0eg0Zi5Mys/CL1ba3nO9x9l84MX11UBZ2r7PPVJPrmOtw==
    orchestratorBackend:
      package: "ghcr.io/redhat-developer/rhdh-plugin-export-overlays/red-hat-developer-hub-backstage-plugin-orchestrator-backend:pr_1214__6.1.3!red-hat-developer-hub-backstage-plugin-orchestrator-backend"
      integrity: sha512-Kr55YbuVwEADwGef9o9wyimcgHmiwehPeAtVHa9g2RQYoSPEa6BeOlaPzB6W5Ke3M2bN/0j0XXtpLuvrlXQogA==
    scaffolderBackendOrchestrator:
      package: "ghcr.io/redhat-developer/rhdh-plugin-export-overlays/red-hat-developer-hub-backstage-plugin-scaffolder-backend-module-orchestrator:pr_1214__0.3.7!red-hat-developer-hub-backstage-plugin-scaffolder-backend-module-orchestrator"
      integrity: sha512-Bueeix4661fXEnfJ9y31Yw91LXJgw6hJUG7lPVdESCi9VwBCjDB9Rm8u2yPqP8sriwr0OMtKtqD+Odn3LOPyVw==
    orchestratorFormWidgets:
      package: "ghcr.io/redhat-developer/rhdh-plugin-export-overlays/red-hat-developer-hub-backstage-plugin-orchestrator-form-widgets:pr_1214__0.2.6!red-hat-developer-hub-backstage-plugin-orchestrator-form-widgets"
      integrity: sha512-Tqn6HO21Q1TQ7TFUoRhwBVCtSBzbQYz+OaanzzIB0R24O6YtVx3wR7Chtr5TzC05Vz5GkBO1+FZid8BKpqljgA==
{{- end }}

## To use OCI images, the plugin package must be in the following format:
## ghcr.io/redhat-developer/rhdh-plugin-export-overlays/red-hat-developer-hub-backstage-plugin-orchestrator:pr_1214__3.1.3!red-hat-developer-hub-backstage-plugin-orchestrator
## The ! is mandatory, and you must include the suffix after the !.
## The plugin name suffixes are the following:
## red-hat-developer-hub-backstage-plugin-orchestrator
## red-hat-developer-hub-backstage-plugin-orchestrator-backend
## red-hat-developer-hub-backstage-plugin-scaffolder-backend-module-orchestrator
## red-hat-developer-hub-backstage-plugin-orchestrator-form-widgets
