/*****************************************************************************/
/*                                                                           */
/* Collaborative Research Centre of the DFG:                                 */
/*                                                                           */
/*   SFB453 High-Fidelity Telepresence and Teleaction                        */
/*                                                                           */
/*   Project I1: Integrated Mobile and Bimanual Multi-User Telepresence and  */
/*               Teleaction Systems with Haptic Feedback                     */
/*                                                                           */
/*                                                                           */
/*****************************************************************************/
/*                                                                           */
/* Transformation of rotation matrix to Quaternion                           */
/*                                                                           */
/* Organization: Institute of Automatic Control Engineering (LSR)            */
/* Authors:      Angelika Peer                                               */
/*               Kwang Kyu Lee                                               */  
/* Contact:      mailto: Angelika.Peer@tum.de                                */
/*                        					             */
/* Date:	 2.1.2005                                                    */
/* (C) 2002 - 2007, Technische Universitaet Muenchen. All rights reserved.   */
/*                                                                           */
/*****************************************************************************/


#define S_FUNCTION_NAME  rot2Q_S
#define S_FUNCTION_LEVEL 2

#include "simstruc.h"
#include <math.h> 

/*================*
 * Build checking *
 *================*/
#if !defined(MATLAB_MEX_FILE)
/*
 * This file cannot be used directly with the Real-Time Workshop. However,
 * this S-function does work with the Real-Time Workshop via
 * the Target Language Compiler technology. See 
 * matlabroot/toolbox/simulink/blocks/tlc_c/timestwo.tlc   for the C version
 * matlabroot/toolbox/simulink/blocks/tlc_ada/timestwo.tlc for the Ada version
 */
# error This_file_can_be_used_only_during_simulation_inside_Simulink
#endif

/* Function: mdlInitializeSizes ===============================================
 * Abstract:
 *   Setup sizes of the various vectors.
 */
 
 
static void mdlInitializeSizes(SimStruct *S)
{
    ssSetNumSFcnParams(S, 0);
    if (ssGetNumSFcnParams(S) != ssGetSFcnParamsCount(S)) {
        return; /* Parameter mismatch will be reported by Simulink */
    }

    if (!ssSetNumInputPorts(S, 1)) return;

/*** set the width of the input port 1*/
    ssSetInputPortMatrixDimensions(S, 0, 3, 3);
    ssSetInputPortDirectFeedThrough(S, 0, 1);

/*** set the width of the output port 1*/
    if (!ssSetNumOutputPorts(S,1)) return;
    ssSetOutputPortWidth(S, 0, 4);

    ssSetNumSampleTimes(S, 1);

    /* Take care when specifying exception free code - see sfuntmpl_doc.c */
    ssSetOptions(S, SS_OPTION_EXCEPTION_FREE_CODE |
                 SS_OPTION_USE_TLC_WITH_ACCELERATOR);

}


/* Function: mdlInitializeSampleTimes =========================================
 * Abstract:
 *    Specifiy that we inherit our sample time from the driving block.
 */
static void mdlInitializeSampleTimes(SimStruct *S)
{
    ssSetSampleTime(S, 0, INHERITED_SAMPLE_TIME);
    ssSetOffsetTime(S, 0, 0.0);
}


/* Function: mdlOutputs =======================================================*/
static void mdlOutputs(SimStruct *S, int_T tid)
{
/***write your code here
 define constants  */
  #define INDEX(i,j) (3*(j-1)+i-1)
  int i;
  real_T ROT[9];
  real_T TR,KX,KX1,KY,KY1,KZ,KZ1,NM,TLS;
  real_T ADD,QS,QV[3];
  real_T *Q = ssGetOutputPortRealSignal(S,0);
  InputRealPtrsType Input = ssGetInputPortRealSignalPtrs(S,0);

  for (i=0;i<9;i++) ROT[i] = *(Input[i]);
  TR=ROT[INDEX(1,1)]+ROT[INDEX(2,2)]+ROT[INDEX(3,3)];
  QS = sqrt(TR+1)/2.0;
  KX = ROT[INDEX(3,2)] - ROT[INDEX(2,3)];	/* Sz - Ay*/
  KY = ROT[INDEX(1,3)] - ROT[INDEX(3,1)];	/* Ax - Nz*/
  KZ = ROT[INDEX(2,1)] - ROT[INDEX(1,2)];	/* Ny - Sx*/

  if ((ROT[INDEX(1,1)]>=ROT[INDEX(2,2)]) & (ROT[INDEX(1,1)]>=ROT[INDEX(3,3)]))
    {
    KX1 = ROT[INDEX(1,1)] - ROT[INDEX(2,2)] - ROT[INDEX(3,3)] + 1;/*Nx - Sy - Az + 1*/
	KY1 = ROT[INDEX(2,1)] + ROT[INDEX(1,2)];			  /*Ny+ Sx*/
	KZ1 = ROT[INDEX(3,1)] + ROT[INDEX(1,3)];			  /*Nz + Ax*/
	ADD = (KX >= 0);
	}
  else if (ROT[INDEX(2,2)] >= ROT[INDEX(3,3)])
	{
    KX1 = ROT[INDEX(2,1)] + ROT[INDEX(1,2)];			/* Ny + Sx*/
	KY1 = ROT[INDEX(2,2)] - ROT[INDEX(1,1)] - ROT[INDEX(3,3)] + 1;	/* Sy - Nx - Az + 1*/
	KZ1 = ROT[INDEX(3,2)] + ROT[INDEX(2,3)];			/* Sz + Ay*/
	ADD = (KY >= 0);
	}
  else{
	KX1 = ROT[INDEX(3,1)] + ROT[INDEX(1,3)];			/* Nz + Ax*/
	KY1 = ROT[INDEX(3,2)] + ROT[INDEX(2,3)];			/* Sz + Ay*/
	KZ1 = ROT[INDEX(3,3)] - ROT[INDEX(1,1)] - ROT[INDEX(2,2)] + 1;	/* Az - Nx - Sy + 1*/
	ADD = (KZ >= 0);
    }

  if (ADD)
  {
	KX = KX + KX1;
	KY = KY + KY1;
	KZ = KZ + KZ1;
  }
  else
  {
	KX = KX - KX1;
	KY = KY - KY1;
	KZ = KZ - KZ1;
  }
  NM = sqrt(KX*KX+KY*KY+KZ*KZ);
  if (NM ==0) {
    Q[0] = 1;
    Q[1] = 0;
    Q[2] = 0;
    Q[3] = 0;
  }
  else
  {
    TLS  = sqrt(1 - pow(QS,2)) / NM;
	QV[0] = TLS*KX;
	QV[1] = TLS*KY;
	QV[2] = TLS*KZ;
    Q[0] = QS;
    Q[1] = QV[0];
    Q[2] = QV[1];
    Q[3] = QV[2];
  }
 }

/* Function: mdlTerminate =====================================================
 * Abstract:
 *    No termination needed, but we are required to have this routine.
 */
static void mdlTerminate(SimStruct *S)
{
}
#if defined(MATLAB_MEX_FILE)
#define MDL_RTW
/* Function: mdlRTW ===========================================================
 * Abstract:
 *  Since we've declared all are parameters as non-tunable, we need
 *  only provide this routine so that they aren't written to the model.rtw
 *  file. The values of the parameters are implicitly encoded in the
 *  sample times.
 */
static void mdlRTW(SimStruct *S)
{
}
#endif /* MDL_RTW */


#ifdef  MATLAB_MEX_FILE    /* Is this file being compiled as a MEX-file? */
#include "simulink.c"      /* MEX-file interface mechanism */
#else
#include "cg_sfun.h"       /* Code generation registration function */
#endif
