meta:
  id: pb7
  file-extension: pb7
  license: MIT
  endian: le
seq:
  - id: a
    type: blk_a
  - id: b
    type: blk_b
  - id: c
    type: blk_c
  - id: d
    type: blk_d
  - id: bs
    type: blk_bs
types:
  blk_a:
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
        type: u1
      - id: multi_0
        type: u1
      - id: mark_value
        type: u2
      - id: pid
        type: u4
      - id: nature
        type: u1
      - id: multi_1
        type: u1
      - id: evs
        type: u1
        repeat: expr
        repeat-expr: 6
      - id: avs
        type: u1
        repeat: expr
        repeat-expr: 6
      - id: unused_0
        size: 1
      - id: multi_2
        type: u1
      - id: height_absolute
        size: 12
      - id: unused_1
        size: 2
      - id: height_scalar
        type: u1
      - id: weight_scalar
        type: u1
      - id: multi_3
        type: u4
  blk_b:
    seq:
      - id: nickname
        size: 24
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
      - id: unused_0
        size: 2
      - id: multi_0
        type: u4
  blk_c:
    seq:
      - id: ht
        size: 24
      - id: enc_chk_0
        type: enc_chk
      - id: ht_gender
        type: u1
      - id: current_handler
        type: u1
      - id: unused_0
        size: 14
      - id: ht_friendship
        type: u1
      - id: unused_1
        size: 1
      - id: ht_intensity
        type: u1
      - id: ht_memory
        type: u1
      - id: ht_feeling
        type: u1
      - id: unused_2
        size: 1
      - id: ht_textvar
        type: u2
      - id: unused3
        size: 2
      - id: field_event_fatigue_0
        type: u1
      - id: field_event_fatigue_1
        type: u1
      - id: fullness
        type: u1
      - id: enjoyment
        type: u1
  blk_d:
    seq:
      - id: ot
        size: 26
      - id: ot_friendship
        type: u1
      - id: unused_0
        size: 6
      - id: egg_date
        type: u1
        repeat: expr
        repeat-expr: 3
      - id: met_date
        type: u1
        repeat: expr
        repeat-expr: 3
      - id: rank
        type: u1
      - id: egg_location
        type: u2
      - id: met_location
        type: u2
      - id: ball
        type: u1
      - id: multi_0
        type: u1
      - id: multi_1
        type: u1
      - id: version
        type: u1
      - id: unused_1
        size: 3
      - id: language
        type: u1
      - id: weight_absolute
        size: 4
  blk_bs:
    seq:
      - id: status_condition
        type: u4
      - id: stat_level
        type: u1
      - id: dirt_type
        type: u1
      - id: dirt_location
        type: u1
      - id: unused_0
        size: 1
      - id: stats
        type: u2
        repeat: expr
        repeat-expr: 8
      - id: unused_1
        size-eos: true
  enc_chk:
    seq:
      - id: enc_chk
        size: 2
        contents: [0, 0]
instances:
  species:
    value: a.species
  ability:
    value: a.ability
  multi_a0:
    value: a.multi_0
  ability_num:
    value: 'multi_a0 & 7'
  fav:
    value: '(multi_a0 & 8) != 0'
  multi_a1:
    value: a.multi_1
  fateful_encounter:
    value: '(multi_a1 & 1) == 1'
  gender:
    value: '(multi_a1 >> 1) & 3'
  form:
    value: 'multi_a1 >> 3'
  language:
    value: d.language
  pkrs:
    value: a.multi_2
  pkrs_days:
    value: 'pkrs & 0xF'
  pkrs_strain: 
    value: 'pkrs >> 4'
  form_argument:
    value: a.multi_3
  form_argumant_remain:
    value: form_argument
  form_argument_elapsed:
    value: '(form_argument >> 8)'
  form_argument_maximum:
    value: '(form_argument >> 16)'
  ivs32:
    value: b.multi_0
  ivs: 
    value: '[ivs32 & 0x1F, (ivs32 >> 5) & 0x1F, (ivs32 >> 10) & 0x1F, (ivs32 >> 15) & 0x1F, (ivs32 >> 20) & 0x1F, (ivs32 >> 25) & 0x1F]'
  is_egg:
    value: '((ivs32 >> 30) & 1) == 1'
  has_nickname:
    value: '((ivs32 >> 31) & 1) == 1'
  multi_d0:
    value: d.multi_0
  met_lvl:
    value: 'multi_d0 & ~0x80'
  ot_gender:
    value: 'multi_d0 >> 7'
  ht_flags:
    value: d.multi_1
  hts:
    value: '[((ht_flags >> 0) & 1) == 1, ((ht_flags >> 1) & 1) == 1, ((ht_flags >> 2) & 1) == 1, ((ht_flags >> 3) & 1) == 1, ((ht_flags >> 4) & 1) == 1, ((ht_flags >> 5) & 1) == 1]'
  tidsid:
    value: a.tidsid
  pid:
    value: a.pid
  shiny_xor:
    value: '(tidsid >> 16) ^ (tidsid & 0xFFFF) ^ (pid >> 16) ^ (pid & 0xFFFF)'
  is_shiny:
    value: 'shiny_xor < 15'
  shiny_type:
    value: 'is_shiny ? shiny_xor == 0 ? "Square" : "Star" : ""'
  ball: 
    value: d.ball
  held_item:
    value: a.held_item
  nature:
    value: a.nature
  evs:
    value: a.evs
  moves:
    value: b.moves
  ot:
    value: d.ot
  ot_lang:
    value: language
