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
    scope: "https://github.com/rhdhorchestrator/orchestrator-plugins-internal-release/releases/download/v1.6.0-rc.7"
    orchestrator:
      package: "backstage-plugin-orchestrator-1.6.0-rc.7.tgz"
      integrity: sha512-tT7IVjCMxmVvpKG1yClC/W2y1/ObHvACLYmR+W0MLMuSB5Jnsdj1OmCd0gGbdpmaUySpNi7vc7mJ1alJ8/JvHw==
    orchestratorBackend:
      package: "backstage-plugin-orchestrator-backend-dynamic-1.6.0-rc.7.tgz"
      integrity: sha512-mW6stwzp/Nl4aU9kkzG7XsQrFwRtUGdMN2qMv86Vo7ketyG+WzQ7g5v36bbGS/1rNLZa8R0+ksulMqOON2J3JQ==
    scaffolderBackendOrchestrator:
      package: "backstage-plugin-scaffolder-backend-module-orchestrator-dynamic-1.6.0-rc.7.tgz"
      integrity: sha512-OtPqBNtuPJ35gjagRG6DDplrjwQYQerkYJA8cA7zjdzeJGBJtEGReG4EEjzaXj4sOyvQ6lXhIUFbYYs1Qnni/A==
    orchestratorFormWidgets:
      package: "backstage-plugin-orchestrator-form-widgets-1.6.0-rc.7.tgz"
      integrity: sha512-VWX/taVAqFTvpBDujPbtUB6VLPbg3Lxhf0GI43yt5Jlm0zyxR54h1yOAwRmuxRD41X0txPxawN4uxE3WSpOYrQ==
{{- end }}