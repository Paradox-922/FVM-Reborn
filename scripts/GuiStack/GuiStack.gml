/// 

enum GuiEnum {
    LABORATORY = 0,
    STAGE_DETAIL = 1,
}

function GuiStack() constructor {
    /// @type {Array<Enum.GuiEnum>} 
    self.stack = []

    /// @param {Enum.GuiEnum} _gui_enum 
    /// @returns {Asset.GMObject.GuiStack} 
    static push = function(_gui_enum) {
        array_push(self.stack, _gui_enum)
        return self
    }

    /// @returns {Asset.GMObject.GuiStack} 
    static pop = function() {
        array_pop(self.stack)
        return self
    }

    /// @param {Enum.GuiEnum} _gui_enum
    /// @returns {Asset.GMObject.GuiStack} 
    static pop_until = function(_gui_enum) {
        while (array_length(self.stack) > 0 && self.stack[array_length(self.stack) - 1] != _gui_enum) {
            array_pop(self.stack)
        }
        return self
    }

    /// @returns {Enum.GuiEnum|Undefined} 
    static get_top = function() {
        if (array_length(self.stack) == 0) {
            return undefined
        }
        return self.stack[array_length(self.stack) - 1]
    }
}