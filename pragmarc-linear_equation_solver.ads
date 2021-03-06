-- PragmAda Reusable Component (PragmARC)
-- Copyright (C) 2016 by PragmAda Software Engineering.  All rights reserved.
-- **************************************************************************
--
-- Solves linear equations of the form A * X = B for X, where A is a matrix and X and B are vectors
-- Works for indeterminate linear equations
-- Uses QR factorization
--
-- History:
-- 2016 Jun 01     J. Carter          V1.1--Changed formatting
-- 2000 May 01     J. Carter          V1.0--Initial release
--
with PragmARC.Matrix_Math;
with Ada.Numerics.Generic_Elementary_Functions;

use Ada;
generic -- PragmARC.Linear_Equation_Solver
   type Supplied_Real is digits <>;
package PragmARC.Linear_Equation_Solver is
   pragma Pure;

   subtype Real is Supplied_Real'Base;

   package Real_Math is new Numerics.Generic_Elementary_Functions (Float_Type => Real);

   package Real_Matrix is new
      PragmARC.Matrix_Math (Element => Real, Neg_One_Element => -1.0, Zero_Element => 0.0, Sqrt => Real_Math.Sqrt);

   function Solve_Linear_Equation (A : Real_Matrix.Matrix; B : Real_Matrix.Vector) return Real_Matrix.Vector;
   -- Uses matrix operations from Real_Matrix; may raise any of the exceptions defined in PragmARC.Matrix_Math
end PragmARC.Linear_Equation_Solver;
--
-- This is free software; you can redistribute it and/or modify it under
-- terms of the GNU General Public License as published by the Free Software
-- Foundation; either version 2, or (at your option) any later version.
-- This software is distributed in the hope that it will be useful, but WITH
-- OUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
-- for more details. Free Software Foundation, 59 Temple Place - Suite
-- 330, Boston, MA 02111-1307, USA.
--
-- As a special exception, if other files instantiate generics from this
-- unit, or you link this unit with other files to produce an executable,
-- this unit does not by itself cause the resulting executable to be
-- covered by the GNU General Public License. This exception does not
-- however invalidate any other reasons why the executable file might be
-- covered by the GNU Public License.
