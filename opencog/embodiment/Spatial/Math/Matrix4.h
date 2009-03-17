#ifndef MATRIX4_H
#define MATRIX4_H

#include <vector>
#include "Vector4.h"

namespace Spatial {
  namespace Math {
    

    /**
     * A 4x4 matrix representation
     */
    class Matrix4 {
    public:
      // All elements of the matrix are 0	
      static const Matrix4 ZERO;

      // An identity 4x4 matrix    
      static const Matrix4 IDENTITY;

      /**
       * Simple constructor
       */
      Matrix4( void );

      /**
       * Build a matrix using the given values
       * @param m matrix values
       */    
      Matrix4( const std::vector<std::vector<double> >& m );

      /**
       * Build a matrix using the given values
       * @param e00
       * @param e01
       * @param e02
       * @param e03
       * @param e10
       * @param e11
       * @param e12
       * @param e13
       * @param e20
       * @param e21
       * @param e22
       * @param e23
       * @param e30
       * @param e31
       * @param e32
       * @param e33
       */
      Matrix4( double e00, double e01, double e02, double e03,
	       double e10, double e11, double e12, double e13,
	       double e20, double e21, double e22, double e23,
	       double e30, double e31, double e32, double e33 );
     
      /**
       * A copy constructor
       * @param matrix
       */
      Matrix4( const Matrix4& matrix );



      inline virtual ~Matrix4( void ) { };

      /**
       * Compute the matrix determinant
       * @return determinant of this matrix
       */
      double determinant( void );

      /**
       * Do the transpose of a copy of this matrix
       * @return Transposed matrix
       */    
      Matrix4 transpose(void);

      /**
       * Inverse a copy of this matrix 
       * @return an inversed matrix
       */    
      Matrix4 inverse(void);

      /**
       * Set a new value for a specific matrix element
       * @param x
       * @param y
       * @param value
       */    
      void set( int x, int y, double value );

      /**
       * Get the value of a specific matrix element
       * @param x
       * @param y
       * @return
       */    
      double get( int x, int y ) const;

      /**
       * Multiply a given 4 dimension vector by this matrix and return the result
       * @param v
       * @return
       */
      Vector4 operator*( const Vector4& v ) const;

      Matrix4& operator=( const Matrix4& m );
	

      /**
       * Create a array containing the matrix values following the OpenGL matrix format
       * @return
       */
      std::vector<double> getOpenGLArray( void ) const;
      
      /* 
       * 
       */
      std::string toString( void ) const;

	
    private:

      /**
       * Helper minor function used to compute determinant
       * @param r0
       * @param r1
       * @param r2
       * @param c0
       * @param c1
       * @param c2
       * @return
       */
      double MINOR( int r0, int r1, int r2, int c0, int c1, int c2) const;

      std::vector<std::vector<double> > m;
	
    }; // Matrix4


  }; // Math
}; // Spatial

#endif // MATRIX4_H
