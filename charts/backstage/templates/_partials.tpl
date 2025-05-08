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
                module: OrchestratorPlugin
                name: orchestratorIcon
            dynamicRoutes:
              - importName: OrchestratorPage
                menuItem:
                  icon: orchestratorIcon
                  text: Orchestrator
                module: OrchestratorPlugin
                path: /orchestrator
  - disabled: false
    package: "{{ $config.orchestratorPlugins.scope }}/{{ $config.orchestratorPlugins.scaffolderBackendOrchestrator.package }}"
    integrity: "{{ $config.orchestratorPlugins.scaffolderBackendOrchestrator.integrity }}"
    pluginConfig:
      orchestrator:
        dataIndexService:
          url: http://sonataflow-platform-data-index-service.{{ .Release.Namespace }}
  - disbaled: false
    package: "{{ $config.orchestratorPlugins.scope }}/{{ $config.orchestratorPlugins.orchestratorFormWidgets.package }}"
    integrity: "{{ $config.orchestratorPlugins.orchestratorFormWidgets.integrity }}"
{{- end }}

{{- define "orchestrator.plugins.config" }}
orchestratorPlugins: 
    scope: "https://github.com/rhdhorchestrator/orchestrator-plugins-internal-release/releases/download/v1.6.0-rc.3"
    orchestrator:
      package: "backstage-plugin-orchestrator-1.6.0-rc.3.tgz"
      integrity: sha512-b0Px4lYGVgwr0pd3VFg6bFt26B8Mkv/HYfTDlhqC3jFRdb8WZGYOSIbSjCegpE12uRxBn+P3e+4qqqg2NS3lMQ==
    orchestratorBackend:
      package: "backstage-plugin-orchestrator-backend-dynamic-1.6.0-rc.3.tgz"
      integrity: sha512-ghGboDXc24f5jZLUMNkw86l8P+FDPYIvea8OMrcSrCCGRiSazEAgZd7IwzbJ61s0tIY5m5bDd7PHJOfleizXqQ==
    scaffolderBackendOrchestrator:
      package: "backstage-plugin-scaffolder-backend-module-orchestrator-dynamic-1.6.0-rc.3.tgz"
      integrity: sha512-L94IksLT0BF0YRB1BQ+IAEoG0NkCNojy2tQtD6e39JgsbC/Ht9mytNLxWRAa/+ppV+yz+mFGHDyiqaa1YQaRTA==
    orchestratorFormWidgets:
      package: "backstage-plugin-orchestrator-form-widgets-1.6.0-rc.3.tgz"
      integrity: sha512-86TWZctRwmQC0MPTa2QBxwBgE4k26CN633jDv0F4iaT0TKRfr9fhT4HZEAOyBxmPe/P2QlPj5BQchF7T7YTkzA==
{{- end }}