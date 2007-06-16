------------------------------------------------------------------------
-- Conversions
------------------------------------------------------------------------

module Prelude.Algebraoid.Conversion where

open import Prelude.BinaryRelation
open import Prelude.Algebra
open import Prelude.Algebra.RingProperties
open import Prelude.Algebraoid
open Setoid

commSemiringoid⟶semiringoid : CommutativeSemiringoid -> Semiringoid
commSemiringoid⟶semiringoid cs = record
  { setoid   = setoid
  ; _+_      = _+_
  ; _*_      = _*_
  ; 0#       = 0#
  ; 1#       = 1#
  ; semiring = CommutativeSemiring.semiring setoid commSemiring
  }
  where open module CS = CommutativeSemiringoid cs

commRingoid⟶ringoid
  : CommutativeRingoid -> Ringoid
commRingoid⟶ringoid cr = record
  { setoid = setoid
  ; _+_    = _+_
  ; _*_    = _*_
  ; -_     = -_
  ; 0#     = 0#
  ; 1#     = 1#
  ; ring   = CommutativeRing.ring setoid commRing
  }
  where open module CR = CommutativeRingoid cr

commRingoid⟶commSemiringoid
  : CommutativeRingoid -> CommutativeSemiringoid
commRingoid⟶commSemiringoid cr = record
  { setoid       = setoid
  ; _+_          = _+_
  ; _*_          = _*_
  ; 0#           = 0#
  ; 1#           = 1#
  ; commSemiring = record
      { semiring = semiring (commRingoid⟶ringoid cr)
      ; *-comm   = CommutativeRing.*-comm setoid commRing
      }
  }
  where open module CR = CommutativeRingoid cr

boolAlgoid⟶latticoid : BooleanAlgebraoid -> Latticoid
boolAlgoid⟶latticoid b = record
  { setoid = setoid
  ; _∨_    = _∨_
  ; _∧_    = _∧_
  ; lattice = BooleanAlgebra.lattice setoid booleanAlgebra
  }
  where open module B = BooleanAlgebraoid b
