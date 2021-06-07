#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.5.0
# from Racc grammar file "".
#

require 'racc/parser.rb'

require_relative './lexer'

class HCLParser < Racc::Parser

module_eval(<<'...end parse.y/module_eval...', 'parse.y', 130)
  #//
  #//       HCL is unclear on what one should do when duplicate
  #//       keys are encountered.
  #//
  #//       from decoder.go: if we're at the root or we're directly within
  #//                        a list, decode  to hashes, otherwise lists
  #//
  #//       from object.go:  there is a flattened list structure
  #//
  def flatten_objectlist(list)
    (list || {}).each_with_object({}) do |a, h|
      h[a.first] =
        case a.last
        when Hash
          deep_merge(h[a.first] || {}, a.last)
        else
          h[a.first] = a.last
        end
    end
  end


  def on_error(error_token_id, error_value, value_stack)
    error_message = value_stack.to_s.split(',').last.gsub(']', '')
    header = "Parse error at #{error_message} #{error_value} (invalid token: #{error_value})"
    raise Racc::ParseError, header
  end


  def parse(input)
    @lexer = HCLLexer.new.lex(input)
    do_parse
    return @result
  end


  def next_token
    @lexer.shift
  end

  def deep_merge(hash1, hash2)
    hash2.keys.each do |key|
      value1 = hash1[key]
      value2 = hash2[key]

      if value1.is_a?(Hash) && value2.is_a?(Hash)
        hash1[key] = deep_merge(value1, value2)
      else
        hash1[key] = value2
      end
    end

    hash1
  end
...end parse.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    22,    29,    28,    10,    19,    26,    44,    23,     5,    14,
     6,    27,    29,    28,    13,    43,    40,    17,    37,    18,
    14,    14,    27,    34,    29,    28,    32,     5,    40,     6,
    37,     5,    14,     6,    27,     5,    41,     6,   -11,   -10,
    31,    42,    12,    45,    20 ]

racc_action_check = [
    13,    13,    13,     1,    10,    13,    33,    13,     0,    13,
     0,    13,    27,    27,     7,    33,    27,     9,    27,     9,
    27,     9,    27,    27,    44,    44,    26,     3,    44,     3,
    44,    30,    44,    30,    44,    14,    30,    14,     6,     5,
    14,    32,     4,    42,    11 ]

racc_action_pointer = [
     1,     3,   nil,    20,    37,    31,    30,     6,   nil,    10,
     4,    39,   nil,    -2,    28,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    11,     9,   nil,   nil,
    24,   nil,    34,     1,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    27,   nil,    21,   nil,   nil ]

racc_action_default = [
    -2,   -36,    -1,    -3,    -5,   -22,   -23,   -36,   -19,   -36,
   -36,    -7,    -4,   -36,   -36,   -20,   -21,   -22,   -23,    47,
    -6,   -12,   -13,   -14,   -15,   -16,   -18,   -36,   -34,   -35,
   -36,    -9,   -36,   -36,   -25,   -26,   -29,   -30,   -31,   -32,
   -33,    -8,   -36,   -24,   -28,   -17,   -27 ]

racc_goto_table = [
    11,    35,     3,    15,    16,    33,    21,    24,     2,     1,
    25,   nil,   nil,   nil,   nil,   nil,    30,   nil,    46,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    11 ]

racc_goto_check = [
     4,    12,     3,     5,     9,    11,     7,     5,     2,     1,
     8,   nil,   nil,   nil,   nil,   nil,     3,   nil,    12,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     4 ]

racc_goto_pointer = [
   nil,     9,     8,     2,    -3,    -6,   nil,    -7,    -3,    -5,
   nil,   -22,   -26 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,     4,    39,     7,    36,    38,     8,
     9,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 21, :_reduce_1,
  0, 22, :_reduce_2,
  1, 22, :_reduce_none,
  2, 23, :_reduce_4,
  1, 23, :_reduce_5,
  3, 23, :_reduce_6,
  2, 23, :_reduce_7,
  3, 25, :_reduce_8,
  2, 25, :_reduce_9,
  1, 26, :_reduce_10,
  1, 26, :_reduce_11,
  3, 24, :_reduce_12,
  3, 24, :_reduce_13,
  3, 24, :_reduce_14,
  3, 24, :_reduce_15,
  3, 24, :_reduce_16,
  6, 24, :_reduce_17,
  3, 24, :_reduce_18,
  1, 24, :_reduce_19,
  2, 29, :_reduce_20,
  2, 29, :_reduce_21,
  1, 30, :_reduce_22,
  1, 30, :_reduce_23,
  3, 28, :_reduce_24,
  2, 28, :_reduce_25,
  1, 31, :_reduce_26,
  3, 31, :_reduce_27,
  2, 31, :_reduce_28,
  1, 32, :_reduce_29,
  1, 32, :_reduce_30,
  1, 32, :_reduce_31,
  1, 32, :_reduce_32,
  1, 32, :_reduce_33,
  1, 27, :_reduce_34,
  1, 27, :_reduce_35 ]

racc_reduce_n = 36

racc_shift_n = 47

racc_token_table = {
  false => 0,
  :error => 1,
  :BOOL => 2,
  :FLOAT => 3,
  :NUMBER => 4,
  :COMMA => 5,
  :COMMAEND => 6,
  :IDENTIFIER => 7,
  :EQUAL => 8,
  :STRING => 9,
  :MINUS => 10,
  :LEFTBRACE => 11,
  :RIGHTBRACE => 12,
  :LEFTBRACKET => 13,
  :RIGHTBRACKET => 14,
  :LEFTPARENTHESES => 15,
  :RIGHTPARENTHESES => 16,
  :PERIOD => 17,
  :EPLUS => 18,
  :EMINUS => 19 }

racc_nt_base = 20

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "BOOL",
  "FLOAT",
  "NUMBER",
  "COMMA",
  "COMMAEND",
  "IDENTIFIER",
  "EQUAL",
  "STRING",
  "MINUS",
  "LEFTBRACE",
  "RIGHTBRACE",
  "LEFTBRACKET",
  "RIGHTBRACKET",
  "LEFTPARENTHESES",
  "RIGHTPARENTHESES",
  "PERIOD",
  "EPLUS",
  "EMINUS",
  "$start",
  "target",
  "top",
  "objectlist",
  "objectitem",
  "object",
  "objectkey",
  "number",
  "list",
  "block",
  "block_id",
  "listitems",
  "listitem" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'parse.y', 21)
  def _reduce_1(val, _values, result)
     @result = flatten_objectlist(val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 24)
  def _reduce_2(val, _values, result)
     result = val[0]
    result
  end
.,.,

# reduce 3 omitted

module_eval(<<'.,.,', 'parse.y', 30)
  def _reduce_4(val, _values, result)
     result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 32)
  def _reduce_5(val, _values, result)
     result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 34)
  def _reduce_6(val, _values, result)
     result = val[0] << val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 36)
  def _reduce_7(val, _values, result)
     result = val[0] << val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 41)
  def _reduce_8(val, _values, result)
     result = flatten_objectlist(val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 43)
  def _reduce_9(val, _values, result)
     return
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 48)
  def _reduce_10(val, _values, result)
     result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 50)
  def _reduce_11(val, _values, result)
     result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 55)
  def _reduce_12(val, _values, result)
     result = val[0], val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 57)
  def _reduce_13(val, _values, result)
     result = val[0], val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 59)
  def _reduce_14(val, _values, result)
     result = val[0], val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 61)
  def _reduce_15(val, _values, result)
     result = val[0], val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 63)
  def _reduce_16(val, _values, result)
     result = val[0], val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 65)
  def _reduce_17(val, _values, result)
     result = val[0], "#{val[2]}(#{val[4]})"
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 67)
  def _reduce_18(val, _values, result)
     result = val[0], val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 69)
  def _reduce_19(val, _values, result)
     result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 74)
  def _reduce_20(val, _values, result)
     result = val[0], val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 76)
  def _reduce_21(val, _values, result)
     result = val[0], {val[1][0] => val[1][1]}
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 81)
  def _reduce_22(val, _values, result)
     result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 83)
  def _reduce_23(val, _values, result)
     result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 88)
  def _reduce_24(val, _values, result)
     result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 90)
  def _reduce_25(val, _values, result)
     return
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 95)
  def _reduce_26(val, _values, result)
     result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 97)
  def _reduce_27(val, _values, result)
     result = val[0] << val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 99)
  def _reduce_28(val, _values, result)
     result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 104)
  def _reduce_29(val, _values, result)
     result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 106)
  def _reduce_30(val, _values, result)
     result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 108)
  def _reduce_31(val, _values, result)
     result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 110)
  def _reduce_32(val, _values, result)
     result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 112)
  def _reduce_33(val, _values, result)
     result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 117)
  def _reduce_34(val, _values, result)
     result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 119)
  def _reduce_35(val, _values, result)
     result = val[0]
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class HCLParser
