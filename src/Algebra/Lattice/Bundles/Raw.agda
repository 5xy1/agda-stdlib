------------------------------------------------------------------------
-- The Agda standard library
--
-- Definitions of 'raw' bundles
------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

module Algebra.Lattice.Bundles.Raw where

open import Algebra.Core
open import Algebra.Bundles
open import Algebra.Structures
open import Algebra.Lattice.Structures
open import Level using (suc; _⊔_)
open import Relation.Binary

record RawLattice c ℓ : Set (suc (c ⊔ ℓ)) where
  infixr 7 _∧_
  infixr 6 _∨_
  infix  4 _≈_
  field
    Carrier : Set c
    _≈_     : Rel Carrier ℓ
    _∧_     : Op₂ Carrier
    _∨_     : Op₂ Carrier

  ∨-rawMagma : RawMagma c ℓ
  ∨-rawMagma = record { _≈_ = _≈_; _∙_ = _∨_ }

  ∧-rawMagma : RawMagma c ℓ
  ∧-rawMagma = record { _≈_ = _≈_; _∙_ = _∧_ }

  open RawMagma ∨-rawMagma public
    using (_≉_)
