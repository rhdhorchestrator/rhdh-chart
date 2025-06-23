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
    scope: "https://github.com/rhdhorchestrator/orchestrator-plugins-internal-release/releases/download/v1.6.0-rc.11"
    orchestrator:
      package: "backstage-plugin-orchestrator-1.6.0-rc.11.tgz"
      integrity: sha512-jZNnWMh4Hjs9cem5uvmt89j3Yded61EVYk/NbzeqPfW9NFP7oOzNwyfQeG59hsNQ/PEiL7XIEzGp0vIHbHL+Cg==
    orchestratorBackend:
      package: "backstage-plugin-orchestrator-backend-dynamic-1.6.0-rc.11.tgz"
      integrity: sha512-ebw1Uk5xsRzIfMziZ4sZU6UPxfQcHnEqAldAGDxT1vih5t+S/w1LuGlRGhajk3JXeA+RUXA6xfFcr9nNgYGegQ==
    scaffolderBackendOrchestrator:
      package: "backstage-plugin-scaffolder-backend-module-orchestrator-dynamic-1.6.0-rc.11.tgz"
      integrity: sha512-ufHBFH1maL4w9/pxweFFzK2pGbhDfbJwSfPKmQyCtilJRUR7bLSPKXP2ZYYrR8tysiQ0vB6fw2FtuNQNDqHtqQ==
    orchestratorFormWidgets:
      package: "backstage-plugin-orchestrator-form-widgets-1.6.0-rc.11.tgz"
      integrity: sha512-cZwpaHA1MoydTxRU3404AqgjzX+IeW1/2jnqzSHn4XwYNAg5xk5udTSq+zVabmimdeeKXWB3iCWi1sP4bLkdKQ==rk4yNG3s7afMvBtqW0g==
{{- end }}