meta:
  id: px8
  file-extension: pk, pb8
  endian: le
seq:
  - id: encryption_constant
    type: u4
  - id: sanity
    type: u2
  - id: checksum
    type: u2
  - id: species
    type: u2
  - id: held_item
    type: u2
  - id: tidsid
    type: u4
  - id: exp
    type: u4
  - id: ability
    type: u2
  - id: ability_num
    type: u1
  - id: unused_a0
    type: u1
  - id: mark_value
    type: u2
  - id: unused_a1
    type: u1
    repeat: expr
    repeat-expr: 2
  - id: pid
    type: u4
  - id: nature
    type: u1
  - id: stat_nature
    type: u1
  - id: multi_a0
    type: u1
  - id: unused_a3
    type: u1
  - id: form
    type: u2
  - id: evs
    type: u1
    repeat: expr
    repeat-expr: 6
  - id: cnts
    type: u1
    repeat: expr
    repeat-expr: 6
  - id: pkrs
    type: u1
  - id: unused_a4
    type: u1
  - id: ribbons
    type: u1
    repeat: expr
    repeat-expr: 20
  - id: sociability
    type: u4
  - id: unused_a5
    type: u1
    repeat: expr
    repeat-expr: 4
  - id: height_scalar
    type: u1
  - id: weight_scalar
    type: u1
  - id: unused_a6
    type: u1
    repeat: expr
    repeat-expr: 6
  - id: nickname
    type: str
    size: 24
    encoding: UTF-8
  - id: enc_chk_0
    type: enc_chk
  - id: moves
    type: u2
    repeat: expr
    repeat-expr: 4
  - id: move_pps
    type: u1
    repeat: expr
    repeat-expr: 4
  - id: move_ppups
    type: u1
    repeat: expr
    repeat-expr: 4
  - id: relearn_moves
    type: u2
    repeat: expr
    repeat-expr: 4
  - id: stat_hpcurrent
    type: u2
  - id: ivs32
    type: u4
  - id: gmax_level
    type: u1
  - id: unused_b0
    type: u1
    repeat: expr
    repeat-expr: 3
  - id: status_condition
    type: u4
  - id: unk98
    type: u4
  - id: unused_b1
    type: u1
    repeat: expr
    repeat-expr: 12
  - id: ht
    type: str
    size: 24
    encoding: UTF-8
  - id: enc_chk_1
    type: enc_chk
  - id: ht_gender
    type: u1
  - id: ht_language
    type: u1
  - id: current_handler
    type: u1
  - id: unused_c0
    type: u1
  - id: ht_trainer_id
    type: u2
  - id: ht_friendship
    type: u1
  - id: ht_intensity
    type: u1
  - id: ht_memory
    type: u1
  - id: ht_feeling
    type: u1
  - id: ht_textvar
    type: u2
  - id: unused_c1
    type: u1
    repeat: expr
    repeat-expr: 14
  - id: fullness
    type: u1
  - id: enjoyment
    type: u1
  - id: version
    type: u1
  - id: battle_version
    type: u1
  - id: region
    type: u1
  - id: console_region
    type: u1
  - id: language
    type: u1
  - id: unke3
    type: u1
  - id: form_argument
    type: u4
  - id: affixed_ribbon
    type: u1
  - id: unused_c2
    type: u1
    repeat: expr
    repeat-expr: 15
  - id: ot
    type: str
    size: 26
    encoding: UTF-8
  - id: ot_friendship
    type: u1
  - id: ot_intensity
    type: u1
  - id: ot_memory
    type: u1
  - id: unused_d0
    type: u1
  - id: ot_textvar
    type: u2
  - id: ot_feeling
    type: u1
  - id: egg_date
    type: u1
    repeat: expr
    repeat-expr: 3
  - id: met_date
    type: u1
    repeat: expr
    repeat-expr: 3
  - id: unused_d1
    type: u1
  - id: egg_location
    type: u2
  - id: met_location
    type: u2
  - id: ball
    type: u1
  - id: multi_d0
    type: u1
  - id: hyper_train_flags
    type: u1
  - id: move_record_flag
    type: u1
  - id: unused_d2
    type: u1
    repeat: expr
    repeat-expr: 13
  - id: tracker
    type: u8
  - id: unused_d3
    type: u1
    repeat: expr
    repeat-expr: 11
  - id: stat_level
    type: u1
  - id: unused_e0
    type: u1
  - id: stats
    type: u2
    repeat: expr
    repeat-expr: 6
  - id: unused_e1
    type: u1
    repeat: expr
    repeat-expr: 2
types:
  enc_chk:
    seq:
      - id: enc_chk
        size: 2
        contents: [0x0, 0x0]
instances:
  has_nickname:
    value: '((ivs32 >> 31) & 1) == 1'
  is_shiny:
    value: '((tidsid >> 16) ^ (tidsid & 0xFFFF) ^ (pid >> 16) ^ (pid & 0xFFFF)) < 15'
  ivs: 
    value: '[ivs32 & 0x1F, (ivs32 >> 5) & 0x1F, (ivs32 >> 10) & 0x1F, (ivs32 >> 20) & 0x1F, (ivs32 >> 25) & 0x1F, (ivs32 >> 15) & 0x1F]'
