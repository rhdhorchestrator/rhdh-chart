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
    scope: "https://github.com/rhdhorchestrator/orchestrator-plugins-internal-release/releases/download/v1.6.0-rc.9"
    orchestrator:
      package: "backstage-plugin-orchestrator-1.6.0-rc.9.tgz"
      integrity: sha512-0/Eo9SqRtC9AmWkdJk+nhJSmSDBvKg1eWl0to5rOqsQiWRk57MUEaWRLwjK6fwu9975EJw3XvrTrmgYmFsI0mg==
    orchestratorBackend:
      package: "backstage-plugin-orchestrator-backend-dynamic-1.6.0-rc.9.tgz"
      integrity: sha512-LQVUYGUSelYDubbwMG5PT9ITYlaghsTCp37ktIsLjC9Qlr2NeA20xAIV4oDhtNVkoRraR6iFmVVKXnD/D2yrLg==
    scaffolderBackendOrchestrator:
      package: "backstage-plugin-scaffolder-backend-module-orchestrator-dynamic-1.6.0-rc.9.tgz"
      integrity: sha512-4F563LxlAzGakDx4J63szF0i8YyO6ZVRz0i9Bp/Qessdp1E+zlRCgyIqHWSgQGUopzVzNrT20LmHQUzosH0naw==
    orchestratorFormWidgets:
      package: "backstage-plugin-orchestrator-form-widgets-1.6.0-rc.9.tgz"
      integrity: sha512-O5lwQ4dezu6ueZEHJ3rUXsjBGs8N5zTK540L8nAufx2DYyKApBuEMj4PJStW6rKFuA53HB49+y35wUhS40Fw1g==
{{- end }}