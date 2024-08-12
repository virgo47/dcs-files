The "patches" for PP files are differences from DCS-BIOS defaults.
These are cumulative changes, not just diffs from the latest DCS-COINS pp file.

The structure of PP entry is:

* Aircraft Parameter ID
* TP State ID
* TP State Description (DCS-BIOS description)
* Action Type
  0: No action
  1: "set_state"
  2: "fixed_step" DEC INC by 1
  3: "variable_step" -<num> +<num>|"suggested_step":<num>
  4: "action": arg:"TOGGLE"
  5: "hold"/"set_state"
  6: "connector/slider control/variable_step" (superset of "3")
* Action Step - increment/decrement value (if applicable)
* Enumerated list of options/Range of values
* TP Default (Starting) value

