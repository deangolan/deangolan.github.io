// Generated by js_of_ocaml
//# buildInfo:effects=false, kind=cmo, use-js-string=true, version=5.5.2

//# unitInfo: Provides: Dune__exe__Rules
//# unitInfo: Requires: Stdlib, Stdlib__Hashtbl, Stdlib__Int
(function
  (globalThis){
   "use strict";
   var
    runtime = globalThis.jsoo_runtime,
    caml_equal = runtime.caml_equal,
    caml_maybe_attach_backtrace = runtime.caml_maybe_attach_backtrace;
   function caml_call1(f, a0){
    return (f.l >= 0 ? f.l : f.l = f.length) == 1
            ? f(a0)
            : runtime.caml_call_gen(f, [a0]);
   }
   function caml_call2(f, a0, a1){
    return (f.l >= 0 ? f.l : f.l = f.length) == 2
            ? f(a0, a1)
            : runtime.caml_call_gen(f, [a0, a1]);
   }
   function caml_call3(f, a0, a1, a2){
    return (f.l >= 0 ? f.l : f.l = f.length) == 3
            ? f(a0, a1, a2)
            : runtime.caml_call_gen(f, [a0, a1, a2]);
   }
   var
    global_data = runtime.caml_get_global_data(),
    Stdlib_Hashtbl = global_data.Stdlib__Hashtbl,
    Stdlib_Int = global_data.Stdlib__Int,
    Stdlib = global_data.Stdlib,
    NoProp = [248, "Dune__exe__Rules.NoProp", runtime.caml_fresh_oo_id(0)],
    cst_No_proposition_in_line = "No proposition in line: ",
    _b_ = [0, 737456202, 0],
    _a_ = [0, 737456202, 1];
   function check(pattern, p, q){
    var p$0 = p, q$0 = q;
    for(;;){
     var _b$_ = caml_call2(pattern, p$0, q$0);
     if(_b$_)
      var _ca_ = _b$_;
     else{
      if(typeof p$0 !== "number"){
       var _cb_ = p$0[1];
       if(3903731 === _cb_){
        if(typeof q$0 !== "number" && 3903731 === q$0[1]){
         var q$1 = q$0[2], p$1 = p$0[2], p$0 = p$1, q$0 = q$1;
         continue;
        }
       }
       else if
        (748545548 === _cb_ && typeof q$0 !== "number" && 748545548 === q$0[1]){
        var
         _cc_ = q$0[2],
         q2 = _cc_[3],
         p2 = _cc_[2],
         conn2 = _cc_[1],
         match = p$0[2],
         q1 = match[3],
         p1 = match[2],
         conn1 = match[1];
        if(conn1 === conn2){
         var
          _cd_ = check(pattern, p1, p2),
          _ce_ = _cd_ || check(pattern, q1, q2);
         if(_ce_)
          var _cf_ = caml_equal(p1, p2), _cg_ = _cf_ || caml_equal(q1, q2);
         else
          var _cg_ = _ce_;
         return _cg_;
        }
       }
      }
      var _ca_ = 0;
     }
     return _ca_;
    }
   }
   function is_valid(lines, line){
    function find_prop(linenum){
     var match = caml_call2(Stdlib_Hashtbl[7], lines, linenum);
     if(match){var line = match[1]; return line[1];}
     var _b__ = caml_call1(Stdlib_Int[12], linenum);
     throw caml_maybe_attach_backtrace
            ([0,
              NoProp,
              caml_call2(Stdlib[28], cst_No_proposition_in_line, _b__)],
             1);
    }
    var match = line[2], prop = line[1];
    if(typeof match === "number") return 1;
    var _b1_ = match[1];
    if(179928923 > _b1_){
     if(-641755978 === _b1_){
      var a$5 = match[2];
      return check(doublenegation, find_prop(a$5), prop);
     }
     if(-530603023 <= _b1_){
      if(17017 <= _b1_){
       var a$6 = match[2];
       return check(le, find_prop(a$6), prop);
      }
      var a$7 = match[2];
      return check(associative, find_prop(a$7), prop);
     }
     if(-608679825 > _b1_){
      var a$9 = match[2];
      return check(commutative, find_prop(a$9), prop);
     }
     var
      match$1 = match[2],
      b$0 = match$1[2],
      a$8 = match$1[1],
      p2$0 = find_prop(b$0),
      p1$0 = find_prop(a$8);
     if(typeof p1$0 !== "number" && 748545548 === p1$0[1]){
      var _b6_ = p1$0[2], _b7_ = _b6_[1];
      if
       (typeof _b7_ === "number"
        &&
         814983936 === _b7_ && typeof p2$0 !== "number" && 3903731 === p2$0[1]){
       var
        p2$1 = p2$0[2],
        p1$2 = _b6_[3],
        q1$0 = _b6_[2],
        _b8_ = caml_equal(p1$2, p2$1),
        _b9_ = _b8_ ? caml_equal(q1$0, [0, 3903731, prop]) : _b8_;
       return _b9_;
      }
     }
     return 0;
    }
    if(316735838 <= _b1_){
     if(463545110 <= _b1_){
      if(696721332 <= _b1_){
       var a = match[2];
       return check(distributive, find_prop(a), prop);
      }
      var a$0 = match[2];
      return check(dominance, find_prop(a$0), prop);
     }
     if(402400965 <= _b1_){
      var a$1 = match[2];
      return check(demorgans, find_prop(a$1), prop);
     }
     var a$2 = match[2];
     return check(identity, find_prop(a$2), prop);
    }
    if(282006685 <= _b1_){
     var a$3 = match[2];
     return check(idempotence, find_prop(a$3), prop);
    }
    var
     match$0 = match[2],
     b = match$0[2],
     a$4 = match$0[1],
     p2 = find_prop(b),
     p1 = find_prop(a$4);
    if(typeof p1 !== "number" && 748545548 === p1[1]){
     var _b2_ = p1[2], _b3_ = _b2_[1];
     if(typeof _b3_ === "number" && 814983936 === _b3_){
      var
       q1 = _b2_[3],
       p1$1 = _b2_[2],
       _b4_ = caml_equal(p1$1, p2),
       _b5_ = _b4_ ? caml_equal(q1, prop) : _b4_;
      return _b5_;
     }
    }
    return 0;
   }
   function le(p, q){
    a:
    if(typeof p !== "number" && 748545548 === p[1]){
     var _bx_ = p[2], _by_ = _bx_[1];
     b:
     {
      if(3653065 <= _by_){
       if(814983936 <= _by_){
        if(typeof q === "number") break a;
        if(748545548 !== q[1]) break a;
        var _bz_ = q[2], _bA_ = _bz_[1];
        if(typeof _bA_ !== "number") break a;
        if(17731 !== _bA_) break a;
        var _bB_ = _bz_[2];
        if(typeof _bB_ === "number") break a;
        if(3903731 !== _bB_[1]) break a;
        var q2 = _bz_[3], p2 = _bB_[2], q1 = _bx_[3], p1 = _bx_[2];
        break b;
       }
       if(typeof q === "number") break a;
       if(748545548 !== q[1]) break a;
       var _bE_ = q[2], _bF_ = _bE_[1];
       if(typeof _bF_ !== "number") break a;
       if(3257015 !== _bF_) break a;
       var _bG_ = _bE_[2];
       if(typeof _bG_ === "number") break a;
       if(748545548 !== _bG_[1]) break a;
       var _bH_ = _bG_[2], _bI_ = _bH_[1];
       if(typeof _bI_ !== "number") break a;
       if(814983936 !== _bI_) break a;
       var _bJ_ = _bE_[3];
       if(typeof _bJ_ === "number") break a;
       if(748545548 !== _bJ_[1]) break a;
       var _bK_ = _bJ_[2], _bL_ = _bK_[1];
       if(typeof _bL_ !== "number") break a;
       if(814983936 !== _bL_) break a;
       var
        p3 = _bK_[3],
        q3 = _bK_[2],
        q2$0 = _bH_[3],
        p2$0 = _bH_[2],
        q1$0 = _bx_[3],
        p1$0 = _bx_[2];
      }
      else{
       if(3257015 > _by_){
        var _bY_ = _bx_[2];
        if(typeof _bY_ === "number") break a;
        if(3903731 !== _bY_[1]) break a;
        if(typeof q === "number") break a;
        if(748545548 !== q[1]) break a;
        var _bZ_ = q[2], _b0_ = _bZ_[1];
        if(typeof _b0_ !== "number") break a;
        if(814983936 !== _b0_) break a;
        var q2 = _bx_[3], p2 = _bY_[2], q1 = _bZ_[3], p1 = _bZ_[2];
        break b;
       }
       var _bQ_ = _bx_[2];
       if(typeof _bQ_ === "number") break a;
       if(748545548 !== _bQ_[1]) break a;
       var _bR_ = _bQ_[2], _bS_ = _bR_[1];
       if(typeof _bS_ !== "number") break a;
       if(814983936 !== _bS_) break a;
       var _bT_ = _bx_[3];
       if(typeof _bT_ === "number") break a;
       if(748545548 !== _bT_[1]) break a;
       var _bU_ = _bT_[2], _bV_ = _bU_[1];
       if(typeof _bV_ !== "number") break a;
       if(814983936 !== _bV_) break a;
       if(typeof q === "number") break a;
       if(748545548 !== q[1]) break a;
       var _bW_ = q[2], _bX_ = _bW_[1];
       if(typeof _bX_ !== "number") break a;
       if(3653065 !== _bX_) break a;
       var
        p3 = _bU_[3],
        q3 = _bU_[2],
        q2$0 = _bR_[3],
        p2$0 = _bR_[2],
        q1$0 = _bW_[3],
        p1$0 = _bW_[2];
      }
      var _bM_ = caml_equal(p1$0, p2$0);
      if(_bM_){
       var _bN_ = caml_equal(p2$0, p3);
       if(_bN_)
        var
         _bO_ = caml_equal(q1$0, q2$0),
         _bP_ = _bO_ ? caml_equal(q2$0, q3) : _bO_;
       else
        var _bP_ = _bN_;
      }
      else
       var _bP_ = _bM_;
      return _bP_;
     }
     var _bC_ = caml_equal(p1, p2), _bD_ = _bC_ ? caml_equal(q1, q2) : _bC_;
     return _bD_;
    }
    return 0;
   }
   function idempotence(p, q){
    a:
    if(typeof p !== "number" && 748545548 === p[1]){
     var _bv_ = p[2], _bw_ = _bv_[1];
     if(typeof _bw_ === "number"){
      if(17731 !== _bw_ && 3257015 !== _bw_) break a;
      var p2$0 = _bv_[3], p1$0 = _bv_[2];
      if(caml_equal(p1$0, p2$0)) return caml_equal(p1$0, q);
     }
    }
    a:
    if(typeof q !== "number" && 748545548 === q[1]){
     var _bt_ = q[2], _bu_ = _bt_[1];
     if(typeof _bu_ === "number"){
      if(17731 !== _bu_ && 3257015 !== _bu_) break a;
      var p2 = _bt_[3], p1 = _bt_[2];
      if(caml_equal(p1, p2)) return caml_equal(p1, p);
     }
    }
    return 0;
   }
   function commutative(p, q){
    a:
    if(typeof p !== "number" && 748545548 === p[1]){
     var _bp_ = p[2], conn1 = _bp_[1];
     if(typeof conn1 === "number"){
      if(17731 !== conn1 && 3257015 !== conn1 && 3653065 !== conn1) break a;
      if(typeof q !== "number" && 748545548 === q[1]){
       var match = q[2], conn2 = match[1], q1 = _bp_[3], p1 = _bp_[2];
       if(typeof conn2 === "number"){
        if(17731 !== conn2 && 3257015 !== conn2 && 3653065 !== conn2) break a;
        var p2 = match[3], q2 = match[2], _bq_ = caml_equal(conn1, conn2);
        if(_bq_)
         var
          _br_ = caml_equal(p1, p2),
          _bs_ = _br_ ? caml_equal(q1, q2) : _br_;
        else
         var _bs_ = _bq_;
        return _bs_;
       }
      }
     }
    }
    return 0;
   }
   function associative(p, q){
    if(typeof p !== "number" && 748545548 === p[1]){
     var _a3_ = p[2], _a4_ = _a3_[1];
     if(typeof _a4_ === "number")
      if(17731 === _a4_){
       var _a5_ = _a3_[2];
       if(typeof _a5_ !== "number" && 748545548 === _a5_[1]){
        var _a6_ = _a5_[2], _a7_ = _a6_[1];
        if
         (typeof _a7_ === "number"
          && 17731 === _a7_ && typeof q !== "number" && 748545548 === q[1]){
         var _a8_ = q[2], _a9_ = _a8_[1];
         if(typeof _a9_ === "number" && 17731 === _a9_){
          var _a__ = _a8_[3];
          if(typeof _a__ !== "number" && 748545548 === _a__[1]){
           var _a$_ = _a__[2], _ba_ = _a$_[1];
           if(typeof _ba_ === "number" && 17731 === _ba_){
            var
             r2 = _a$_[3],
             q2 = _a$_[2],
             p2 = _a8_[2],
             r1 = _a3_[3],
             q1 = _a6_[3],
             p1 = _a6_[2],
             _bb_ = caml_equal(p1, p2);
            if(_bb_)
             var
              _bc_ = caml_equal(q1, q2),
              _bd_ = _bc_ ? caml_equal(r1, r2) : _bc_;
            else
             var _bd_ = _bb_;
            return _bd_;
           }
          }
         }
        }
       }
      }
      else if(3257015 === _a4_){
       var _be_ = _a3_[2];
       if(typeof _be_ !== "number" && 748545548 === _be_[1]){
        var _bf_ = _be_[2], _bg_ = _bf_[1];
        if
         (typeof _bg_ === "number"
          && 3257015 === _bg_ && typeof q !== "number" && 748545548 === q[1]){
         var _bh_ = q[2], _bi_ = _bh_[1];
         if(typeof _bi_ === "number" && 3257015 === _bi_){
          var _bj_ = _bh_[3];
          if(typeof _bj_ !== "number" && 748545548 === _bj_[1]){
           var _bk_ = _bj_[2], _bl_ = _bk_[1];
           if(typeof _bl_ === "number" && 3257015 === _bl_){
            var
             r2$0 = _bk_[3],
             q2$0 = _bk_[2],
             p2$0 = _bh_[2],
             r1$0 = _a3_[3],
             q1$0 = _bf_[3],
             p1$0 = _bf_[2],
             _bm_ = caml_equal(p1$0, p2$0);
            if(_bm_)
             var
              _bn_ = caml_equal(q1$0, q2$0),
              _bo_ = _bn_ ? caml_equal(r1$0, r2$0) : _bn_;
            else
             var _bo_ = _bm_;
            return _bo_;
           }
          }
         }
        }
       }
      }
    }
    return 0;
   }
   function distributive(p, q){
    a:
    if(typeof p !== "number" && 748545548 === p[1]){
     var _ab_ = p[2], _ac_ = _ab_[1];
     if(typeof _ac_ === "number"){
      b:
      {
       c:
       {
        if(17731 === _ac_){
         var _ad_ = _ab_[2], _ae_ = _ab_[3];
         if(typeof _ae_ !== "number" && 748545548 === _ae_[1]){
          var _at_ = _ae_[2], _au_ = _at_[1];
          if
           (typeof _au_ === "number"
            && 3257015 === _au_ && typeof q !== "number" && 748545548 === q[1]){
           var _av_ = q[2], _aw_ = _av_[1];
           if(typeof _aw_ === "number" && 3257015 === _aw_){
            var _ax_ = _av_[2];
            if(typeof _ax_ !== "number" && 748545548 === _ax_[1]){
             var _ay_ = _ax_[2], _az_ = _ay_[1];
             if(typeof _az_ === "number" && 17731 === _az_){
              var _aA_ = _av_[3];
              if(typeof _aA_ !== "number" && 748545548 === _aA_[1]){
               var _aB_ = _aA_[2], _aC_ = _aB_[1];
               if(typeof _aC_ === "number" && 17731 === _aC_){
                var
                 r2$0 = _aB_[3],
                 p3$0 = _aB_[2],
                 q2$0 = _ay_[3],
                 p2$0 = _ay_[2],
                 r1$0 = _at_[3],
                 q1$0 = _at_[2],
                 p1$0 = _ad_;
                break c;
               }
              }
             }
            }
           }
          }
         }
         if(typeof _ad_ === "number") break a;
         if(748545548 !== _ad_[1]) break a;
         var _af_ = _ad_[2], _ag_ = _af_[1];
         if(typeof _ag_ !== "number") break a;
         if(3257015 !== _ag_) break a;
         var _ah_ = _ab_[3];
         if(typeof _ah_ === "number") break a;
         if(748545548 !== _ah_[1]) break a;
         var _ai_ = _ah_[2], _aj_ = _ai_[1];
         if(typeof _aj_ !== "number") break a;
         if(3257015 !== _aj_) break a;
         if(typeof q === "number") break a;
         if(748545548 !== q[1]) break a;
         var _ak_ = q[2], _al_ = _ak_[1];
         if(typeof _al_ !== "number") break a;
         if(3257015 !== _al_) break a;
         var _am_ = _ak_[3];
         if(typeof _am_ === "number") break a;
         if(748545548 !== _am_[1]) break a;
         var _an_ = _am_[2], _ao_ = _an_[1];
         if(typeof _ao_ !== "number") break a;
         if(17731 !== _ao_) break a;
         var
          r2 = _ai_[3],
          p3 = _ai_[2],
          q2 = _af_[3],
          p2 = _af_[2],
          r1 = _an_[3],
          q1 = _an_[2],
          p1 = _ak_[2];
         break b;
        }
        if(3257015 !== _ac_) break a;
        var _aH_ = _ab_[2];
        if(typeof _aH_ !== "number" && 748545548 === _aH_[1]){
         var _aT_ = _aH_[2], _aU_ = _aT_[1];
         if(typeof _aU_ === "number" && 17731 === _aU_){
          var _aV_ = _ab_[3];
          if(typeof _aV_ !== "number" && 748545548 === _aV_[1]){
           var _aW_ = _aV_[2], _aX_ = _aW_[1];
           if
            (typeof _aX_ === "number"
             && 17731 === _aX_ && typeof q !== "number" && 748545548 === q[1]){
            var _aY_ = q[2], _aZ_ = _aY_[1];
            if(typeof _aZ_ === "number" && 17731 === _aZ_){
             var _a0_ = _aY_[3];
             if(typeof _a0_ !== "number" && 748545548 === _a0_[1]){
              var _a1_ = _a0_[2], _a2_ = _a1_[1];
              if(typeof _a2_ === "number" && 3257015 === _a2_){
               var
                r2$0 = _aW_[3],
                p3$0 = _aW_[2],
                q2$0 = _aT_[3],
                p2$0 = _aT_[2],
                r1$0 = _a1_[3],
                q1$0 = _a1_[2],
                p1$0 = _aY_[2];
               break c;
              }
             }
            }
           }
          }
         }
        }
        var _aI_ = _ab_[3];
        if(typeof _aI_ === "number") break a;
        if(748545548 !== _aI_[1]) break a;
        var _aJ_ = _aI_[2], _aK_ = _aJ_[1];
        if(typeof _aK_ !== "number") break a;
        if(17731 !== _aK_) break a;
        if(typeof q === "number") break a;
        if(748545548 !== q[1]) break a;
        var _aL_ = q[2], _aM_ = _aL_[1];
        if(typeof _aM_ !== "number") break a;
        if(17731 !== _aM_) break a;
        var _aN_ = _aL_[2];
        if(typeof _aN_ === "number") break a;
        if(748545548 !== _aN_[1]) break a;
        var _aO_ = _aN_[2], _aP_ = _aO_[1];
        if(typeof _aP_ !== "number") break a;
        if(3257015 !== _aP_) break a;
        var _aQ_ = _aL_[3];
        if(typeof _aQ_ === "number") break a;
        if(748545548 !== _aQ_[1]) break a;
        var _aR_ = _aQ_[2], _aS_ = _aR_[1];
        if(typeof _aS_ !== "number") break a;
        if(3257015 !== _aS_) break a;
        var
         r2 = _aR_[3],
         p3 = _aR_[2],
         q2 = _aO_[3],
         p2 = _aO_[2],
         r1 = _aJ_[3],
         q1 = _aJ_[2],
         p1 = _aH_;
        break b;
       }
       var _aD_ = caml_equal(p1$0, p2$0);
       if(_aD_){
        var _aE_ = caml_equal(p2$0, p3$0);
        if(_aE_)
         var
          _aF_ = caml_equal(q1$0, q2$0),
          _aG_ = _aF_ ? caml_equal(r1$0, r2$0) : _aF_;
        else
         var _aG_ = _aE_;
       }
       else
        var _aG_ = _aD_;
       return _aG_;
      }
      var _ap_ = caml_equal(p1, p2);
      if(_ap_){
       var _aq_ = caml_equal(p2, p3);
       if(_aq_)
        var
         _ar_ = caml_equal(q1, q2),
         _as_ = _ar_ ? caml_equal(r1, r2) : _ar_;
       else
        var _as_ = _aq_;
      }
      else
       var _as_ = _ap_;
      return _as_;
     }
    }
    return 0;
   }
   function doublenegation(p, q){
    if(typeof p !== "number" && 3903731 === p[1]){
     var match$0 = p[2];
     if(typeof match$0 !== "number" && 3903731 === match$0[1]){var p1 = match$0[2]; return caml_equal(p1, q);}
    }
    if(typeof q !== "number" && 3903731 === q[1]){
     var match = q[2];
     if(typeof match !== "number" && 3903731 === match[1]){var p2 = match[2]; return caml_equal(p, p2);}
    }
    return 0;
   }
   function demorgans(p, q){
    a:
    if(typeof p !== "number"){
     var _H_ = p[1];
     if(3903731 === _H_){
      var _I_ = p[2];
      if(typeof _I_ === "number") break a;
      if(748545548 !== _I_[1]) break a;
      var _J_ = _I_[2], _K_ = _J_[1];
      if(typeof _K_ !== "number") break a;
      if(17731 !== _K_ && 3257015 !== _K_) break a;
      if(typeof q === "number") break a;
      if(748545548 !== q[1]) break a;
      var _L_ = q[2], _M_ = _L_[1], _N_ = _J_[3], _O_ = _J_[2];
      if(typeof _M_ !== "number") break a;
      if(17731 !== _M_ && 3257015 !== _M_) break a;
      var _P_ = _L_[2];
      if(typeof _P_ === "number") break a;
      if(3903731 !== _P_[1]) break a;
      var _Q_ = _L_[3];
      if(typeof _Q_ === "number") break a;
      if(3903731 !== _Q_[1]) break a;
      var
       q2 = _Q_[2],
       p2 = _P_[2],
       conn2 = _M_,
       q1 = _N_,
       p1 = _O_,
       conn1 = _K_;
     }
     else{
      if(748545548 !== _H_) break a;
      var _U_ = p[2], _V_ = _U_[1];
      if(typeof _V_ !== "number") break a;
      if(17731 !== _V_ && 3257015 !== _V_) break a;
      var _W_ = _U_[2];
      if(typeof _W_ === "number") break a;
      if(3903731 !== _W_[1]) break a;
      var _X_ = _U_[3];
      if(typeof _X_ === "number") break a;
      if(3903731 !== _X_[1]) break a;
      if(typeof q === "number") break a;
      if(3903731 !== q[1]) break a;
      var _Y_ = q[2];
      if(typeof _Y_ === "number") break a;
      if(748545548 !== _Y_[1]) break a;
      var _Z_ = _Y_[2], ___ = _Z_[1], _$_ = _X_[2], _aa_ = _W_[2];
      if(typeof ___ !== "number") break a;
      if(17731 !== ___ && 3257015 !== ___) break a;
      var
       q2 = _Z_[3],
       p2 = _Z_[2],
       conn2 = ___,
       q1 = _$_,
       p1 = _aa_,
       conn1 = _V_;
     }
     var _R_ = runtime.caml_notequal(conn1, conn2);
     if(_R_)
      var _S_ = caml_equal(p1, p2), _T_ = _S_ ? caml_equal(q1, q2) : _S_;
     else
      var _T_ = _R_;
     return _T_;
    }
    return 0;
   }
   function identity(p, q){
    a:
    {
     b:
     if(typeof p !== "number" && 748545548 === p[1]){
      var _A_ = p[2], _B_ = _A_[1];
      if(typeof _B_ === "number"){
       if(17731 === _B_){
        var _C_ = _A_[2];
        c:
        {
         if(typeof _C_ !== "number" && 737456202 === _C_[1] && ! _C_[2]){var p1$0 = _A_[3]; break c;}
         var _D_ = _A_[3];
         if(typeof _D_ === "number") break b;
         if(737456202 !== _D_[1]) break b;
         if(_D_[2]) break b;
         var p1$0 = _C_;
        }
        var p2 = q, p1 = p1$0;
        break a;
       }
       if(3257015 === _B_){
        var _E_ = _A_[2];
        c:
        {
         if(typeof _E_ !== "number" && 737456202 === _E_[1] && _E_[2]){var _G_ = _A_[3]; break c;}
         var _F_ = _A_[3];
         if(typeof _F_ === "number") break b;
         if(737456202 !== _F_[1]) break b;
         if(! _F_[2]) break b;
         var _G_ = _E_;
        }
        var p2 = q, p1 = _G_;
        break a;
       }
      }
     }
     b:
     if(typeof q !== "number" && 748545548 === q[1]){
      var _s_ = q[2], _t_ = _s_[1];
      if(typeof _t_ === "number"){
       if(17731 === _t_){
        var _u_ = _s_[2];
        c:
        {
         if(typeof _u_ !== "number" && 737456202 === _u_[1] && ! _u_[2]){var _w_ = _s_[3]; break c;}
         var _v_ = _s_[3];
         if(typeof _v_ === "number") break b;
         if(737456202 !== _v_[1]) break b;
         if(_v_[2]) break b;
         var _w_ = _u_;
        }
        var p2 = _w_, p1 = p;
        break a;
       }
       if(3257015 === _t_){
        var _x_ = _s_[2];
        c:
        {
         if(typeof _x_ !== "number" && 737456202 === _x_[1] && _x_[2]){var _z_ = _s_[3]; break c;}
         var _y_ = _s_[3];
         if(typeof _y_ === "number") break b;
         if(737456202 !== _y_[1]) break b;
         if(! _y_[2]) break b;
         var _z_ = _x_;
        }
        var p2 = _z_, p1 = p;
        break a;
       }
      }
     }
     return 0;
    }
    return caml_equal(p1, p2);
   }
   function dominance(p, q){
    a:
    {
     b:
     if(typeof p !== "number" && 748545548 === p[1]){
      var _o_ = p[2], _p_ = _o_[1];
      if(typeof _p_ === "number" && 3257015 === _p_){
       var _q_ = _o_[2];
       c:
       {
        if(typeof _q_ !== "number" && 737456202 === _q_[1] && ! _q_[2])
         break c;
        var _r_ = _o_[3];
        if(typeof _r_ === "number" || 737456202 !== _r_[1] || _r_[2]) break b;
       }
       var q$1 = q;
       break a;
      }
     }
     b:
     if(typeof q !== "number" && 748545548 === q[1]){
      var _k_ = q[2], _l_ = _k_[1];
      if(typeof _l_ === "number" && 3257015 === _l_){
       var _m_ = _k_[2];
       c:
       {
        if(typeof _m_ !== "number" && 737456202 === _m_[1] && ! _m_[2])
         break c;
        var _n_ = _k_[3];
        if(typeof _n_ === "number" || 737456202 !== _n_[1] || _n_[2]) break b;
       }
       var q$1 = p;
       break a;
      }
     }
     b:
     {
      c:
      if(typeof p !== "number" && 748545548 === p[1]){
       var _g_ = p[2], _h_ = _g_[1];
       if(typeof _h_ === "number" && 17731 === _h_){
        var _i_ = _g_[2];
        d:
        {
         if(typeof _i_ !== "number" && 737456202 === _i_[1] && _i_[2])
          break d;
         var _j_ = _g_[3];
         if(typeof _j_ === "number" || 737456202 !== _j_[1] || ! _j_[2])
          break c;
        }
        var q$0 = q;
        break b;
       }
      }
      c:
      if(typeof q !== "number" && 748545548 === q[1]){
       var _c_ = q[2], _d_ = _c_[1];
       if(typeof _d_ === "number" && 17731 === _d_){
        var _e_ = _c_[2];
        d:
        {
         if(typeof _e_ !== "number" && 737456202 === _e_[1] && _e_[2])
          break d;
         var _f_ = _c_[3];
         if(typeof _f_ === "number" || 737456202 !== _f_[1] || ! _f_[2])
          break c;
        }
        var q$0 = p;
        break b;
       }
      }
      return 0;
     }
     return caml_equal(_a_, q$0);
    }
    return caml_equal(_b_, q$1);
   }
   function all_valid(lines){
    function aux(linenum, line, acc){
     return acc ? is_valid(lines, line) : acc;
    }
    return caml_call3(Stdlib_Hashtbl[14], aux, lines, 1);
   }
   var Dune_exe_Rules = [0, is_valid, all_valid];
   runtime.caml_register_global(7, Dune_exe_Rules, "Dune__exe__Rules");
   return;
  }
  (globalThis));

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLjAsImZpbGUiOiIubWFpbi5lb2Jqcy9qc29vL2R1bmVfX2V4ZV9fUnVsZXMuY21vLmpzIiwic291cmNlUm9vdCI6IiIsIm5hbWVzIjpbImNoZWNrIiwicGF0dGVybiIsInAiLCJxIiwicCQwIiwicSQwIiwicSQxIiwicCQxIiwicTIiLCJwMiIsImNvbm4yIiwicTEiLCJwMSIsImNvbm4xIiwiaXNfdmFsaWQiLCJsaW5lcyIsImxpbmUiLCJmaW5kX3Byb3AiLCJsaW5lbnVtIiwicHJvcCIsImEkNSIsImRvdWJsZW5lZ2F0aW9uIiwiYSQ2IiwibGUiLCJhJDciLCJhc3NvY2lhdGl2ZSIsImEkOSIsImNvbW11dGF0aXZlIiwiYiQwIiwiYSQ4IiwicDIkMCIsInAxJDAiLCJwMiQxIiwicDEkMiIsInExJDAiLCJhIiwiZGlzdHJpYnV0aXZlIiwiYSQwIiwiZG9taW5hbmNlIiwiYSQxIiwiZGVtb3JnYW5zIiwiYSQyIiwiaWRlbnRpdHkiLCJhJDMiLCJpZGVtcG90ZW5jZSIsImIiLCJhJDQiLCJwMSQxIiwicDMiLCJxMyIsInEyJDAiLCJyMiIsInIxIiwicjIkMCIsInIxJDAiLCJwMyQwIiwiYWxsX3ZhbGlkIiwiYXV4IiwiYWNjIl0sInNvdXJjZXMiOlsiL3dvcmtzcGFjZV9yb290L2pzL3J1bGVzLm1sIl0sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Rzs7Ozs7Rzs7Ozs7Rzs7Ozs7R0FFQTs7Ozs7SUFBQTs7OztZQWlDSUEsTUFBTUMsU0FBUUMsR0FBRUM7SUFDbEIsSUFEZ0JDLE1BQUFGLEdBQUVHLE1BQUFGO0lBQ2xCO0tBQUEsV0FBQSxXQURRRixTQUFRRyxLQUFFQztLQUNsQjs7O2dCQURnQkQ7a0JBQUFBOztrQkFBRUMsZ0NBQUFBO2FBQUFDLE1BQUFELFFBQUZFLE1BQUFILFFBQUFBLE1BQUFHLEtBQUVGLE1BQUFDOzs7OztzQ0FBQUQsa0NBQUFBOztnQkFBQUE7U0FJeUJHO1NBQUpDO1NBQVBDO2lCQUpoQk47U0FJSU87U0FBSkM7U0FBUEM7V0FBQUEsVUFBdUJIO1NBQzNC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YUEsT0FDTkg7S0FHUDtNQUFrQixJQUFBLE1BQUEsV0FKb0JFLElBQ0RILEtBR25CLFlBQVcsV0FKYUUsSUFDSUg7OztLQUdqQjs7SUFFN0I7R0FBSztZQUVQa0MsU0FBU3hDLEdBQUVDO0lBQ2I7OztlQURXRCxnQ0FBQUE7Z0JBQUFBOzs7Ozs7NkVBRWlCNkI7Ozs7O2FBQUFBOztZQUFxQ3RCLEtBRnBETixHQUVlUyxLQUFBbUI7Ozs7Ozs7Ozs7Ozs7O1lBQXFDdEIsS0FGcEROLEdBRWVTOzs7Ozs7ZUFGZlQsZ0NBQUFBO2dCQUFBQTs7Ozs7Ozs7Ozs7OztZQUVvRE0sVUFBckNHLEtBRmpCVjs7Ozs7Ozs7Ozs7Ozs7WUFFc0RPLFVBQXJDRyxLQUZqQlY7Ozs7O0tBUVA7O0lBRkEsT0FBQSxXQUp3QlUsSUFBcUNIO0dBTXhEO1lBRVA2QixVQUFVcEMsR0FBRUM7SUFDZDs7O2VBRFlELGdDQUFBQTtnQkFBQUE7Ozs7Ozs7Ozs7V0FFcURJLE1BRm5ESDs7Ozs7ZUFBQUEsZ0NBQUFBO2dCQUFBQTs7Ozs7Ozs7OztXQUVtREcsTUFGckRKOzs7Ozs7O2dCQUFBQSxnQ0FBQUE7aUJBQUFBOzs7Ozs7Ozs7OztZQUtpREcsTUFML0NGOzs7OztnQkFBQUEsZ0NBQUFBO2lCQUFBQTs7Ozs7Ozs7Ozs7WUFLK0NFLE1BTGpESDs7OztNQVNSOztLQUZBLE9BQUEsZ0JBRnlERzs7SUFEekQsT0FBQSxnQkFGNkRDO0dBT3hEO1lBa0JQa0QsVUFBVXpDO2FBQ1IwQyxJQUFJdkMsU0FBU0YsTUFBSzBDO0tBQU0sT0FBTkEsTUE3SmhCNUMsU0E0Sk1DLE9BQ0tDLFFBQUswQztJQUFrQztJQUN4RCxPQUFBLCtCQURJRCxLQURRMUM7R0FFZTs0QkE5SnJCRCxVQTRKSjBDOzs7RSIsInNvdXJjZXNDb250ZW50IjpbIm9wZW4gTGluZVxuXG5leGNlcHRpb24gTm9Qcm9wIG9mIHN0cmluZ1xuXG5sZXQgcmVjIGlzX3ZhbGlkIGxpbmVzIGxpbmUgPVxuICBsZXQgZmluZF9wcm9wIGxpbmVudW0gPSBtYXRjaCBIYXNodGJsLmZpbmRfb3B0IGxpbmVzIGxpbmVudW0gd2l0aFxuICAgIHwgTm9uZSAtPiByYWlzZSAoTm9Qcm9wIChcIk5vIHByb3Bvc2l0aW9uIGluIGxpbmU6IFwiIF4gSW50LnRvX3N0cmluZyBsaW5lbnVtKSlcbiAgICB8IFNvbWUgbGluZSAtPiBsaW5lLnByb3AgXG4gIGluXG4gIG1hdGNoIGxpbmUgd2l0aFxuICB8IHtwcm9wPSBfOyBkZXJpdmVkYnk9IGBQcmVtaXNlfSAtPlxuICAgICAgdHJ1ZVxuICB8IHtwcm9wOyBkZXJpdmVkYnk9IGBMRSBhfSAtPlxuICAgICAgY2hlY2sgbGUgKGZpbmRfcHJvcCBhKSBwcm9wXG4gIHwge3Byb3A7IGRlcml2ZWRieT0gYElkZW1wb3RlbmNlIGF9IC0+XG4gICAgICBjaGVjayBpZGVtcG90ZW5jZSAoZmluZF9wcm9wIGEpIHByb3BcbiAgfCB7cHJvcDsgZGVyaXZlZGJ5PSBgQ29tbXV0YXRpdmUgYX0gLT5cbiAgICAgIGNoZWNrIGNvbW11dGF0aXZlIChmaW5kX3Byb3AgYSkgcHJvcFxuICB8IHtwcm9wOyBkZXJpdmVkYnk9IGBBc3NvY2lhdGl2ZSBhfSAtPlxuICAgICAgY2hlY2sgYXNzb2NpYXRpdmUgKGZpbmRfcHJvcCBhKSBwcm9wXG4gIHwge3Byb3A7IGRlcml2ZWRieT0gYERpc3RyaWJ1dGl2ZSBhfSAtPlxuICAgICAgY2hlY2sgZGlzdHJpYnV0aXZlIChmaW5kX3Byb3AgYSkgcHJvcFxuICB8IHtwcm9wOyBkZXJpdmVkYnk9IGBEb3VibGVOZWdhdGlvbiBhfSAtPlxuICAgICAgY2hlY2sgZG91YmxlbmVnYXRpb24gKGZpbmRfcHJvcCBhKSBwcm9wXG4gIHwge3Byb3A7IGRlcml2ZWRieT0gYERlTW9yZ2FuIGF9IC0+XG4gICAgICBjaGVjayBkZW1vcmdhbnMgKGZpbmRfcHJvcCBhKSBwcm9wXG4gIHwge3Byb3A7IGRlcml2ZWRieT0gYElkZW50aXR5IGF9IC0+XG4gICAgICBjaGVjayBpZGVudGl0eSAoZmluZF9wcm9wIGEpIHByb3BcbiAgfCB7cHJvcDsgZGVyaXZlZGJ5PSBgRG9taW5hbmNlIGF9IC0+XG4gICAgICBjaGVjayBkb21pbmFuY2UgKGZpbmRfcHJvcCBhKSBwcm9wXG4gIHwge3Byb3A7IGRlcml2ZWRieT0gYE1vZHVzUG9uZW5zIChhLCBiKX0gLT5cbiAgICAgIG1vZHVzcG9uZW5zIChmaW5kX3Byb3AgYSkgKGZpbmRfcHJvcCBiKSBwcm9wXG4gIHwge3Byb3A7IGRlcml2ZWRieT0gYE1vZHVzVG9sbGVucyAoYSwgYil9IC0+XG4gICAgICBtb2R1c3RvbGxlbnMgKGZpbmRfcHJvcCBhKSAoZmluZF9wcm9wIGIpIHByb3BcblxuYW5kIGNoZWNrIHBhdHRlcm4gcCBxID1cbiAgcGF0dGVybiBwIHFcbiAgfHxcbiAgbWF0Y2ggKHAsIHEpIHdpdGhcbiAgfCBgQ29ubiAoY29ubjEsIHAxLCBxMSksIGBDb25uIChjb25uMiwgcDIsIHEyKSB3aGVuIGNvbm4xID0gY29ubjIgLT5cbiAgICAgIChjaGVjayBwYXR0ZXJuIHAxIHAyIHx8IGNoZWNrIHBhdHRlcm4gcTEgcTIpICYmIChwMSA9IHAyIHx8IHExID0gcTIpXG4gIHwgYE5vdCBwLCBgTm90IHEgLT5cbiAgICAgIGNoZWNrIHBhdHRlcm4gcCBxXG4gIHwgXyAtPlxuICAgICAgZmFsc2VcblxuKCogUGF0dGVybnMgZm9yIGVxdWl2YWxlbmNlIHJ1bGVzLiBNdXN0IGJlIHN5bW1ldHJpYy4gKilcblxuYW5kIGxlIHAgcSA9XG4gIG1hdGNoIChwLCBxKSB3aXRoXG4gIHwgYENvbm4gKGBJbXBsLCBwMSwgcTEpLCBgQ29ubiAoYE9yLCBgTm90IHAyLCBxMilcbiAgfCBgQ29ubiAoYE9yLCBgTm90IHAyLCBxMiksIGBDb25uIChgSW1wbCwgcDEsIHExKSAtPlxuICAgICAgcDEgPSBwMiAmJiBxMSA9IHEyXG4gIHwgKCBgQ29ubiAoYElmZiwgcDEsIHExKVxuICAgICwgYENvbm4gKGBBbmQsIGBDb25uIChgSW1wbCwgcDIsIHEyKSwgYENvbm4gKGBJbXBsLCBxMywgcDMpKSApXG4gIHwgKCBgQ29ubiAoYEFuZCwgYENvbm4gKGBJbXBsLCBwMiwgcTIpLCBgQ29ubiAoYEltcGwsIHEzLCBwMykpXG4gICAgLCBgQ29ubiAoYElmZiwgcDEsIHExKSApIC0+XG4gICAgICBwMSA9IHAyICYmIHAyID0gcDMgJiYgcTEgPSBxMiAmJiBxMiA9IHEzXG4gIHwgXyAtPlxuICAgICAgZmFsc2VcblxuYW5kIGlkZW1wb3RlbmNlIHAgcSA9XG4gIG1hdGNoIChwLCBxKSB3aXRoXG4gIHwgYENvbm4gKChgQW5kIHwgYE9yKSwgcDEsIHAyKSwgcCB3aGVuIHAxID0gcDIgLT5cbiAgICAgIHAxID0gcFxuICB8IHAsIGBDb25uICgoYEFuZCB8IGBPciksIHAxLCBwMikgd2hlbiBwMSA9IHAyIC0+XG4gICAgICBwMSA9IHBcbiAgfCBfIC0+XG4gICAgICBmYWxzZVxuXG5hbmQgY29tbXV0YXRpdmUgcCBxID1cbiAgbWF0Y2ggKHAsIHEpIHdpdGhcbiAgfCAoIGBDb25uICgoKGBBbmQgfCBgT3IgfCBgSWZmKSBhcyBjb25uMSksIHAxLCBxMSlcbiAgICAsIGBDb25uICgoKGBBbmQgfCBgT3IgfCBgSWZmKSBhcyBjb25uMiksIHEyLCBwMikgKSAtPlxuICAgICAgY29ubjEgPSBjb25uMiAmJiBwMSA9IHAyICYmIHExID0gcTJcbiAgfCBfIC0+XG4gICAgICBmYWxzZVxuXG5hbmQgYXNzb2NpYXRpdmUgcCBxID1cbiAgbWF0Y2ggKHAsIHEpIHdpdGhcbiAgfCAoIGBDb25uIChgQW5kLCBgQ29ubiAoYEFuZCwgcDEsIHExKSwgcjEpXG4gICAgLCBgQ29ubiAoYEFuZCwgcDIsIGBDb25uIChgQW5kLCBxMiwgcjIpKSApIC0+XG4gICAgICBwMSA9IHAyICYmIHExID0gcTIgJiYgcjEgPSByMlxuICB8IGBDb25uIChgT3IsIGBDb25uIChgT3IsIHAxLCBxMSksIHIxKSwgYENvbm4gKGBPciwgcDIsIGBDb25uIChgT3IsIHEyLCByMikpXG4gICAgLT5cbiAgICAgIHAxID0gcDIgJiYgcTEgPSBxMiAmJiByMSA9IHIyXG4gIHwgXyAtPlxuICAgICAgZmFsc2VcblxuYW5kIGRpc3RyaWJ1dGl2ZSBwIHEgPVxuICBtYXRjaCAocCwgcSkgd2l0aFxuICB8ICggYENvbm4gKGBPciwgcDEsIGBDb25uIChgQW5kLCBxMSwgcjEpKVxuICAgICwgYENvbm4gKGBBbmQsIGBDb25uIChgT3IsIHAyLCBxMiksIGBDb25uIChgT3IsIHAzLCByMikpIClcbiAgfCAoIGBDb25uIChgQW5kLCBgQ29ubiAoYE9yLCBwMiwgcTIpLCBgQ29ubiAoYE9yLCBwMywgcjIpKVxuICAgICwgYENvbm4gKGBPciwgcDEsIGBDb25uIChgQW5kLCBxMSwgcjEpKSApIC0+XG4gICAgICBwMSA9IHAyICYmIHAyID0gcDMgJiYgcTEgPSBxMiAmJiByMSA9IHIyXG4gIHwgKCBgQ29ubiAoYEFuZCwgcDEsIGBDb25uIChgT3IsIHExLCByMSkpXG4gICAgLCBgQ29ubiAoYE9yLCBgQ29ubiAoYEFuZCwgcDIsIHEyKSwgYENvbm4gKGBBbmQsIHAzLCByMikpIClcbiAgfCAoIGBDb25uIChgT3IsIGBDb25uIChgQW5kLCBwMiwgcTIpLCBgQ29ubiAoYEFuZCwgcDMsIHIyKSlcbiAgICAsIGBDb25uIChgQW5kLCBwMSwgYENvbm4gKGBPciwgcTEsIHIxKSkgKSAtPlxuICAgICAgcDEgPSBwMiAmJiBwMiA9IHAzICYmIHExID0gcTIgJiYgcjEgPSByMlxuICB8IF8gLT5cbiAgICAgIGZhbHNlXG5cbmFuZCBkb3VibGVuZWdhdGlvbiBwIHEgPVxuICBtYXRjaCAocCwgcSkgd2l0aFxuICB8IGBOb3QgKGBOb3QgcDEpLCBwMiAtPlxuICAgICAgcDEgPSBwMlxuICB8IHAxLCBgTm90IChgTm90IHAyKSAtPlxuICAgICAgcDEgPSBwMlxuICB8IF8gLT5cbiAgICAgIGZhbHNlXG5cbmFuZCBkZW1vcmdhbnMgcCBxID1cbiAgbWF0Y2ggKHAsIHEpIHdpdGhcbiAgfCAoIGBOb3QgKGBDb25uICgoKGBBbmQgfCBgT3IpIGFzIGNvbm4xKSwgcDEsIHExKSlcbiAgICAsIGBDb25uICgoKGBBbmQgfCBgT3IpIGFzIGNvbm4yKSwgYE5vdCBwMiwgYE5vdCBxMikgKSBcbiAgfCAoIGBDb25uICgoKGBBbmQgfCBgT3IpIGFzIGNvbm4xKSwgYE5vdCBwMSwgYE5vdCBxMSlcbiAgICAsIGBOb3QgKGBDb25uICgoKGBBbmQgfCBgT3IpIGFzIGNvbm4yKSwgcDIsIHEyKSkgKSAtPlxuICAgICAgY29ubjEgPD4gY29ubjIgJiYgcDEgPSBwMiAmJiBxMSA9IHEyXG4gIHwgXyAtPlxuICAgICAgZmFsc2VcblxuYW5kIGlkZW50aXR5IHAgcSA9XG4gIG1hdGNoIChwLCBxKSB3aXRoXG4gIHwgKGBDb25uIChgQW5kLCBgQm9vbCB0cnVlLCBwMSkgfCBgQ29ubiAoYEFuZCwgcDEsIGBCb29sIHRydWUpKSwgcDIgXG4gIHwgKGBDb25uIChgT3IsIGBCb29sIGZhbHNlLCBwMSkgfCBgQ29ubiAoYE9yLCBwMSwgYEJvb2wgZmFsc2UpKSwgcDIgXG4gIHwgcDEsIChgQ29ubiAoYEFuZCwgYEJvb2wgdHJ1ZSwgcDIpIHwgYENvbm4gKGBBbmQsIHAyLCBgQm9vbCB0cnVlKSkgXG4gIHwgcDEsIChgQ29ubiAoYE9yLCBgQm9vbCBmYWxzZSwgcDIpIHwgYENvbm4gKGBPciwgcDIsIGBCb29sIGZhbHNlKSkgLT5cbiAgICAgIHAxID0gcDJcbiAgfCBfIC0+XG4gICAgICBmYWxzZVxuXG5hbmQgZG9taW5hbmNlIHAgcSA9XG4gIG1hdGNoIHAsIHEgd2l0aFxuICB8IChgQ29ubiAoYEFuZCwgYEJvb2wgZmFsc2UsIF8pIHwgYENvbm4gKGBBbmQsIF8sIGBCb29sIGZhbHNlKSksIHFcbiAgfCBxLCAoYENvbm4gKGBBbmQsIGBCb29sIGZhbHNlLCBfKSB8IGBDb25uIChgQW5kLCBfLCBgQm9vbCBmYWxzZSkpIC0+XG4gICAgICBgQm9vbCBmYWxzZSA9IHFcbiAgfCAoYENvbm4gKGBPciwgYEJvb2wgdHJ1ZSwgXykgfCBgQ29ubiAoYE9yLCBfLCBgQm9vbCB0cnVlKSksIHFcbiAgfCBxLCAoYENvbm4gKGBPciwgYEJvb2wgdHJ1ZSwgXykgfCBgQ29ubiAoYE9yLCBfLCBgQm9vbCB0cnVlKSkgLT5cbiAgICAgIGBCb29sIHRydWUgPSBxXG4gIHwgXyAtPlxuICAgICAgZmFsc2VcblxuKCogUGF0dGVybnMgZm9yIGltcGxpY2F0aW9uIHJ1bGVzLiAqKVxuXG5hbmQgbW9kdXNwb25lbnMgcDEgcDIgcSA9XG4gIG1hdGNoIChwMSwgcDIpIHdpdGhcbiAgfCBgQ29ubiAoYEltcGwsIHAxLCBxMSksIHAyIC0+XG4gICAgICBwMSA9IHAyICYmIHExID0gcVxuICB8IF8gLT5cbiAgICAgIGZhbHNlXG5cbmFuZCBtb2R1c3RvbGxlbnMgcDEgcDIgcSA9XG4gIG1hdGNoIChwMSwgcDIpIHdpdGhcbiAgfCBgQ29ubiAoYEltcGwsIHExLCBwMSksIGBOb3QgcDIgLT5cbiAgICAgIHAxID0gcDIgJiYgcTEgPSBgTm90IHFcbiAgfCBfIC0+XG4gICAgICBmYWxzZVxuXG5sZXQgYWxsX3ZhbGlkIGxpbmVzID1cbiAgbGV0IGF1eCBfbGluZW51bSBsaW5lIGFjYyA9IGFjYyAmJiAoaXNfdmFsaWQgbGluZXMgbGluZSkgaW5cbiAgSGFzaHRibC5mb2xkIGF1eCBsaW5lcyB0cnVlXG4iXX0=