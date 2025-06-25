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
    scope: "https://github.com/rhdhorchestrator/orchestrator-plugins-internal-release/releases/download/v1.6.0-rc.13"
    orchestrator:
      package: "backstage-plugin-orchestrator-1.6.0-rc.13.tgz"
      integrity: sha512-8hG2rviqBzzEVRhbHdyZxRZBPLV2fbsDhmTqZSbB6Yt9fDvKNZ/WIaoDGcMmv4cUcmfI3ozTdd5935/1RJG/nA==
    orchestratorBackend:
      package: "backstage-plugin-orchestrator-backend-dynamic-1.6.0-rc.13.tgz"
      integrity: sha512-bnfDpTa3snJMByumIGOSt0iuT0kQEAA7w9lLY1SrLm++3maWFUw6zAe70DQsT7qv1d+gx6pXCdmyTAxk8L+4dw==
    scaffolderBackendOrchestrator:
      package: "backstage-plugin-scaffolder-backend-module-orchestrator-dynamic-1.6.0-rc.13.tgz"
      integrity: sha512-2ocAxZYxsymLzVNe2ebiD1b9/TxJZyh7TYDcM6PeC1G416Mqf8QJZMuHh44hfBpdDkRRK8qRrVEDOAfDC2J5sA==
    orchestratorFormWidgets:
      package: "backstage-plugin-orchestrator-form-widgets-1.6.0-rc.13.tgz"
      integrity: sha512-F49J8XOql9TPlETzqy5ll0XHM4HZiWQbEzM8RsOdMTaMh6FNoTR04LATFDYTi/gQg4PC5qT8W7wSxH7gH/Gj3w==
{{- end }}