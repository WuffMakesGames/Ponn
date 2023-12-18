{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "window_command_hook",
  "androidactivityinject": "",
  "androidclassname": "",
  "androidcodeinjection": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidPermissions": [],
  "androidProps": true,
  "androidsourcedir": "",
  "author": "",
  "classname": "",
  "copyToTargets": 113497714299118,
  "date": "2019-12-12T01:34:29",
  "description": "",
  "exportToGame": true,
  "extensionVersion": "1.0.0",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"window_command_hook.dll","constants":[],"copyToTargets":9223372036854775807,"filename":"window_command_hook.dll","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_command_hook_raw","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"window_command_hook_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_command_unhook_raw","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"window_command_unhook_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_command_check_raw","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"window_command_check_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_command_run_raw","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"window_command_run_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_command_get_active_raw","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"window_command_get_active_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_command_set_active_raw","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"window_command_set_active_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_get_background_redraw_raw","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"window_get_background_redraw_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_background_redraw_raw","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"window_set_background_redraw_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_get_topmost_raw","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"window_get_topmost_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_topmost_raw","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"window_set_topmost_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_get_taskbar_button_visible_raw","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"window_get_taskbar_button_visible_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_taskbar_button_visible_raw","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"window_set_taskbar_button_visible_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_visible_w_raw","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"window_set_visible_w_raw","help":"","hidden":true,"kind":11,"returnType":2,},
      ],"init":"","kind":1,"order":[
        {"name":"window_command_hook_raw","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_command_unhook_raw","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_command_check_raw","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_command_run_raw","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_command_get_active_raw","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_command_set_active_raw","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_get_background_redraw_raw","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_set_background_redraw_raw","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_get_topmost_raw","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_set_topmost_raw","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_get_taskbar_button_visible_raw","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_set_taskbar_button_visible_raw","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_set_visible_w_raw","path":"extensions/window_command_hook/window_command_hook.yy",},
      ],"origname":"extensions\\window_command_hook.dll","ProxyFiles":[
        {"resourceType":"GMProxyFile","resourceVersion":"1.0","name":"window_command_hook_x64.dll","TargetMask":6,},
      ],"uncompress":false,"usesRunnerInterface":false,},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"window_command_hook.gml","constants":[
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"window_command_close","hidden":false,"value":"$F060",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"window_command_maximize","hidden":false,"value":"$F030",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"window_command_minimize","hidden":false,"value":"$F020",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"window_command_restore","hidden":false,"value":"$F120",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"window_command_resize","hidden":false,"value":"$F000",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"window_command_move","hidden":false,"value":"$F010",},
      ],"copyToTargets":9223372036854775807,"filename":"window_command_hook.gml","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_command_hook_init","argCount":0,"args":[],"documentation":"","externalName":"window_command_hook_init","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_command_hook_prepare_buffer","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"window_command_hook_prepare_buffer","help":"","hidden":true,"kind":11,"returnType":2,},
      ],"init":"window_command_hook_init","kind":2,"order":[
        {"name":"window_command_hook_init","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_command_hook_prepare_buffer","path":"extensions/window_command_hook/window_command_hook.yy",},
      ],"origname":"extensions\\gml.gml","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"autogen.gml","constants":[],"copyToTargets":-1,"filename":"autogen.gml","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_command_hook","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"window_command_hook","help":"window_command_hook(command:int)->bool","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_command_unhook","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"window_command_unhook","help":"window_command_unhook(command:int)->bool","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_command_check","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"window_command_check","help":"window_command_check(command:int)->bool","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_command_run","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"window_command_run","help":"window_command_run(wParam:int, lParam:int = 0)->int","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_command_get_active","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"window_command_get_active","help":"window_command_get_active(command:int)->int","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_command_set_active","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"window_command_set_active","help":"window_command_set_active(command:int, value:bool)->int","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_get_background_redraw","argCount":0,"args":[],"documentation":"","externalName":"window_get_background_redraw","help":"window_get_background_redraw()->bool","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_background_redraw","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"window_set_background_redraw","help":"window_set_background_redraw(enable:bool)->bool","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_get_topmost","argCount":0,"args":[],"documentation":"","externalName":"window_get_topmost","help":"window_get_topmost()->bool","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_topmost","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"window_set_topmost","help":"window_set_topmost(enable:bool)->bool","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_get_taskbar_button_visible","argCount":0,"args":[],"documentation":"","externalName":"window_get_taskbar_button_visible","help":"window_get_taskbar_button_visible()->bool","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_taskbar_button_visible","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"window_set_taskbar_button_visible","help":"window_set_taskbar_button_visible(show_button:bool)->bool","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_visible_w","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"window_set_visible_w","help":"window_set_visible_w(visible:bool)->bool","hidden":false,"kind":2,"returnType":2,},
      ],"init":"","kind":2,"order":[
        {"name":"window_command_unhook","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_command_check","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_command_run","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_command_get_active","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_command_set_active","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_get_background_redraw","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_set_background_redraw","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_get_topmost","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_set_topmost","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_get_taskbar_button_visible","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_set_taskbar_button_visible","path":"extensions/window_command_hook/window_command_hook.yy",},
        {"name":"window_set_visible_w","path":"extensions/window_command_hook/window_command_hook.yy",},
      ],"origname":"extensions\\autogen.gml","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject": "",
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "",
  "iosdelegatename": "",
  "iosplistinject": "",
  "iosProps": true,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "license": "Proprietary",
  "maccompilerflags": "",
  "maclinkerflags": "",
  "macsourcedir": "",
  "options": [],
  "optionsFile": "options.json",
  "packageId": "",
  "parent": {
    "name": "Libraries",
    "path": "folders/Libraries.yy",
  },
  "productId": "",
  "sourcedir": "",
  "supportedTargets": 113497714299118,
  "tvosclassname": "",
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "",
  "tvosdelegatename": "",
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": "",
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
}