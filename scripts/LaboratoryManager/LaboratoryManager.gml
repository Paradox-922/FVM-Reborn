/// 
function LaboratoryManager() constructor {

    self.stages = {}
    self.file_util = new FileUtil()
    static init = function() {

    }

    /// @param {String} _stage_id 
    /// @returns {Struct.CustomStage|Undefined} 
    static get_stage = function(_stage_id) {
        return variable_struct_get(self.stages, _stage_id)
    }

    /// @param {String} _stage_id
    /// @param {Struct.CustomStage} _stage 
    static _add_stage = function(_stage_id, _stage) {
        variable_struct_set(self.stages, _stage_id, _stage)
    }

    /// @param {String} _json_path 
    /// @returns {Struct.Result} 
    static _load_stage = function(_json_path) {
        var _result = self.file_util.load_json_from_path(_json_path)
        if (_result.is_failed()) {
            return _result
        }

        var _json = _result.data
        var _stage = create_custom_stage(_json, _json_path)
        self._add_stage(_stage.id, _stage)

        return new Result().success()
    }


    /// @returns {Struct.Result} 
    static load_all_stages = function() {
        var _json_path_list = self.file_util.find_files_with_extension_recursively(kCustomStageFolder, ".json")
        for (var i = 0; i < array_length(_json_path_list); i++) {
            var _json_path = _json_path_list[i]
            var _result = self._load_stage(_json_path)
            if (_result.is_failed()) {
                return _result
            }
        }
        return new Result().success()
    }

    static dispose = function() {
        self.stages = {}
        self.file_util = undefined
    }
}