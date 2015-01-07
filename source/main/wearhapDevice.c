/*
 * File: wearhapDevice.c
 *
  *
  *   --- THIS FILE GENERATED BY S-FUNCTION BUILDER: 3.0 ---
  *
  *   This file is an S-function produced by the S-Function
  *   Builder which only recognizes certain fields.  Changes made
  *   outside these fields will be lost the next time the block is
  *   used to load, edit, and resave this file. This file will be overwritten
  *   by the S-function Builder block. If you want to edit this file by hand, 
  *   you must change it only in the area defined as:  
  *
  *        %%%-SFUNWIZ_defines_Changes_BEGIN
  *        #define NAME 'replacement text' 
  *        %%% SFUNWIZ_defines_Changes_END
  *
  *   DO NOT change NAME--Change the 'replacement text' only.
  *
  *   For better compatibility with the Simulink Coder, the
  *   "wrapper" S-function technique is used.  This is discussed
  *   in the Simulink Coder's Manual in the Chapter titled,
  *   "Wrapper S-functions".
  *
  *  -------------------------------------------------------------------------
  * | See matlabroot/simulink/src/sfuntmpl_doc.c for a more detailed template |
  *  ------------------------------------------------------------------------- 
* Created: Tue Sep 16 14:36:41 2014
*/
#define S_FUNCTION_LEVEL 2
#define S_FUNCTION_NAME wearhapDevice
/*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/
/* %%%-SFUNWIZ_defines_Changes_BEGIN --- EDIT HERE TO _END */
#define NUM_INPUTS          5
/* Input Port  0 */
#define IN_PORT_0_NAME      motor_cmd_1
#define INPUT_0_WIDTH       4
#define INPUT_DIMS_0_COL    1
#define INPUT_0_DTYPE       real_T
#define INPUT_0_COMPLEX     COMPLEX_NO
#define IN_0_FRAME_BASED    FRAME_NO
#define IN_0_BUS_BASED      0
#define IN_0_BUS_NAME       
#define IN_0_DIMS           1-D
#define INPUT_0_FEEDTHROUGH 1
#define IN_0_ISSIGNED        0
#define IN_0_WORDLENGTH      8
#define IN_0_FIXPOINTSCALING 1
#define IN_0_FRACTIONLENGTH  9
#define IN_0_BIAS            0
#define IN_0_SLOPE           0.125
/* Input Port  1 */
#define IN_PORT_1_NAME      motor_cmd_2
#define INPUT_1_WIDTH       4
#define INPUT_DIMS_1_COL    1
#define INPUT_1_DTYPE       real_T
#define INPUT_1_COMPLEX     COMPLEX_NO
#define IN_1_FRAME_BASED    FRAME_NO
#define IN_1_BUS_BASED      0
#define IN_1_BUS_NAME       
#define IN_1_DIMS           1-D
#define INPUT_1_FEEDTHROUGH 1
#define IN_1_ISSIGNED        0
#define IN_1_WORDLENGTH      8
#define IN_1_FIXPOINTSCALING 1
#define IN_1_FRACTIONLENGTH  9
#define IN_1_BIAS            0
#define IN_1_SLOPE           0.125
/* Input Port  2 */
#define IN_PORT_2_NAME      motor_cmd_3
#define INPUT_2_WIDTH       4
#define INPUT_DIMS_2_COL    1
#define INPUT_2_DTYPE       real_T
#define INPUT_2_COMPLEX     COMPLEX_NO
#define IN_2_FRAME_BASED    FRAME_NO
#define IN_2_BUS_BASED      0
#define IN_2_BUS_NAME       
#define IN_2_DIMS           1-D
#define INPUT_2_FEEDTHROUGH 1
#define IN_2_ISSIGNED        0
#define IN_2_WORDLENGTH      8
#define IN_2_FIXPOINTSCALING 1
#define IN_2_FRACTIONLENGTH  9
#define IN_2_BIAS            0
#define IN_2_SLOPE           0.125
/* Input Port  3 */
#define IN_PORT_3_NAME      motor_cmd_4
#define INPUT_3_WIDTH       4
#define INPUT_DIMS_3_COL    1
#define INPUT_3_DTYPE       real_T
#define INPUT_3_COMPLEX     COMPLEX_NO
#define IN_3_FRAME_BASED    FRAME_NO
#define IN_3_BUS_BASED      0
#define IN_3_BUS_NAME       
#define IN_3_DIMS           1-D
#define INPUT_3_FEEDTHROUGH 1
#define IN_3_ISSIGNED        0
#define IN_3_WORDLENGTH      8
#define IN_3_FIXPOINTSCALING 1
#define IN_3_FRACTIONLENGTH  9
#define IN_3_BIAS            0
#define IN_3_SLOPE           0.125
/* Input Port  4 */
#define IN_PORT_4_NAME      submit_cmd
#define INPUT_4_WIDTH       1
#define INPUT_DIMS_4_COL    1
#define INPUT_4_DTYPE       boolean_T
#define INPUT_4_COMPLEX     COMPLEX_NO
#define IN_4_FRAME_BASED    FRAME_NO
#define IN_4_BUS_BASED      0
#define IN_4_BUS_NAME       
#define IN_4_DIMS           1-D
#define INPUT_4_FEEDTHROUGH 1
#define IN_4_ISSIGNED        0
#define IN_4_WORDLENGTH      8
#define IN_4_FIXPOINTSCALING 1
#define IN_4_FRACTIONLENGTH  9
#define IN_4_BIAS            0
#define IN_4_SLOPE           0.125

#define NUM_OUTPUTS          2
/* Output Port  0 */
#define OUT_PORT_0_NAME      status
#define OUTPUT_0_WIDTH       1
#define OUTPUT_DIMS_0_COL    1
#define OUTPUT_0_DTYPE       real_T
#define OUTPUT_0_COMPLEX     COMPLEX_NO
#define OUT_0_FRAME_BASED    FRAME_NO
#define OUT_0_BUS_BASED      0
#define OUT_0_BUS_NAME       
#define OUT_0_DIMS           1-D
#define OUT_0_ISSIGNED        1
#define OUT_0_WORDLENGTH      8
#define OUT_0_FIXPOINTSCALING 1
#define OUT_0_FRACTIONLENGTH  3
#define OUT_0_BIAS            0
#define OUT_0_SLOPE           0.125
/* Output Port  1 */
#define OUT_PORT_1_NAME      age
#define OUTPUT_1_WIDTH       1
#define OUTPUT_DIMS_1_COL    1
#define OUTPUT_1_DTYPE       real_T
#define OUTPUT_1_COMPLEX     COMPLEX_NO
#define OUT_1_FRAME_BASED    FRAME_NO
#define OUT_1_BUS_BASED      0
#define OUT_1_BUS_NAME       
#define OUT_1_DIMS           1-D
#define OUT_1_ISSIGNED        1
#define OUT_1_WORDLENGTH      8
#define OUT_1_FIXPOINTSCALING 1
#define OUT_1_FRACTIONLENGTH  3
#define OUT_1_BIAS            0
#define OUT_1_SLOPE           0.125

#define NPARAMS              0

#define SAMPLE_TIME_0        INHERITED_SAMPLE_TIME
#define NUM_DISC_STATES      0
#define DISC_STATES_IC       [0]
#define NUM_CONT_STATES      0
#define CONT_STATES_IC       [0]

#define SFUNWIZ_GENERATE_TLC 0
#define SOURCEFILES "__SFB__"
#define PANELINDEX           6
#define USE_SIMSTRUCT        0
#define SHOW_COMPILE_STEPS   0                   
#define CREATE_DEBUG_MEXFILE 0
#define SAVE_CODE_ONLY       0
#define SFUNWIZ_REVISION     3.0
/* %%%-SFUNWIZ_defines_Changes_END --- EDIT HERE TO _BEGIN */
/*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/
#include "simstruc.h"
#include <signal.h>
#include <kogmo_rtdb.h>
#include <VibroWristCommand.h>
#include <VibroWristStatus.h>


#ifndef DIEonERR(value)
#define DIEonERR(value) if (value<0) { \
 fprintf(stderr,"%d DIED in %s line %d with error %p\n",getpid(),__FILE__,__LINE__,(void*)value);}
#endif

/*extern void wearhapDevice_Outputs_wrapper(const real_T *motor_cmd_1,
			const real_T *motor_cmd_2,
			const real_T *motor_cmd_3,
			const real_T *motor_cmd_4,
			real_T *status,
			real_T *age);*/

/*====================*
 * S-function methods *
 *====================*/
/* Function: mdlInitializeSizes ===============================================
 * Abstract:
 *   Setup sizes of the various vectors.
 */
static void mdlInitializeSizes(SimStruct *S)
{

    DECL_AND_INIT_DIMSINFO(inputDimsInfo);
    DECL_AND_INIT_DIMSINFO(outputDimsInfo);
    ssSetNumSFcnParams(S, NPARAMS);
     if (ssGetNumSFcnParams(S) != ssGetSFcnParamsCount(S)) {
	 return; /* Parameter mismatch will be reported by Simulink */
     }

    ssSetNumContStates(S, NUM_CONT_STATES);
    ssSetNumDiscStates(S, NUM_DISC_STATES);

    if (!ssSetNumInputPorts(S, NUM_INPUTS)) return;
    /*Input Port 0 */
    ssSetInputPortWidth(S,  0, INPUT_0_WIDTH);
    ssSetInputPortDataType(S, 0, SS_DOUBLE);
    ssSetInputPortComplexSignal(S, 0, INPUT_0_COMPLEX);
    ssSetInputPortDirectFeedThrough(S, 0, INPUT_0_FEEDTHROUGH);
    ssSetInputPortRequiredContiguous(S, 0, 1); /*direct input signal access*/

    /*Input Port 1 */
    ssSetInputPortWidth(S,  1, INPUT_1_WIDTH);
    ssSetInputPortDataType(S, 1, SS_DOUBLE);
    ssSetInputPortComplexSignal(S, 1, INPUT_1_COMPLEX);
    ssSetInputPortDirectFeedThrough(S, 1, INPUT_1_FEEDTHROUGH);
    ssSetInputPortRequiredContiguous(S, 1, 1); /*direct input signal access*/

    /*Input Port 2 */
    ssSetInputPortWidth(S,  2, INPUT_2_WIDTH);
    ssSetInputPortDataType(S, 2, SS_DOUBLE);
    ssSetInputPortComplexSignal(S, 2, INPUT_2_COMPLEX);
    ssSetInputPortDirectFeedThrough(S, 2, INPUT_2_FEEDTHROUGH);
    ssSetInputPortRequiredContiguous(S, 2, 1); /*direct input signal access*/

    /*Input Port 3 */
    ssSetInputPortWidth(S,  3, INPUT_3_WIDTH);
    ssSetInputPortDataType(S, 3, SS_DOUBLE);
    ssSetInputPortComplexSignal(S, 3, INPUT_3_COMPLEX);
    ssSetInputPortDirectFeedThrough(S, 3, INPUT_3_FEEDTHROUGH);
    ssSetInputPortRequiredContiguous(S, 3, 1); /*direct input signal access*/
    
    /*Input Port 4 */
    ssSetInputPortWidth(S,  4, INPUT_4_WIDTH);
    ssSetInputPortDataType(S, 4, SS_BOOLEAN);
    ssSetInputPortComplexSignal(S, 4, INPUT_4_COMPLEX);
    ssSetInputPortDirectFeedThrough(S, 4, INPUT_4_FEEDTHROUGH);
    ssSetInputPortRequiredContiguous(S, 4, 1); /*direct input signal access*/


    if (!ssSetNumOutputPorts(S, NUM_OUTPUTS)) return;
    /* Output Port 0 */
    ssSetOutputPortWidth(S, 0, OUTPUT_0_WIDTH);
    ssSetOutputPortDataType(S, 0, SS_DOUBLE);
    ssSetOutputPortComplexSignal(S, 0, OUTPUT_0_COMPLEX);
    /* Output Port 1 */
    ssSetOutputPortWidth(S, 1, OUTPUT_1_WIDTH);
    ssSetOutputPortDataType(S, 1, SS_DOUBLE);
    ssSetOutputPortComplexSignal(S, 1, OUTPUT_1_COMPLEX);

    ssSetNumSampleTimes(S, 1);
    ssSetNumRWork(S, 0);
    ssSetNumIWork(S, 0);
    ssSetNumPWork(S, 12);
   // printf("ssSetNumPWork(S,7) = %d\n", ssSetNumPWork(S, 7));
   // printf("ssGetPWork(S) = %p\n", ssGetPWork(S));
   // printf("ssSetPWorkValue(S,0,0xDEADBEEF) = %d\n", ssSetPWorkValue(S,0,0xDEADBEEF));
    ssSetNumModes(S, 0);
    ssSetNumNonsampledZCs(S, 0);

    ssSetSimulinkVersionGeneratedIn(S, "8.3");

    /* Take care when specifying exception free code - see sfuntmpl_doc.c */
    ssSetOptions(S, (SS_OPTION_EXCEPTION_FREE_CODE |
		     SS_OPTION_WORKS_WITH_CODE_REUSE));
}

#if defined(MATLAB_MEX_FILE)
#define MDL_SET_INPUT_PORT_DIMENSION_INFO
static void mdlSetInputPortDimensionInfo(SimStruct        *S, 
                                         int_T            port,
                                         const DimsInfo_T *dimsInfo)
{
    if(!ssSetInputPortDimensionInfo(S, port, dimsInfo)) return;
}
#endif

#define MDL_SET_OUTPUT_PORT_DIMENSION_INFO
#if defined(MDL_SET_OUTPUT_PORT_DIMENSION_INFO)
static void mdlSetOutputPortDimensionInfo(SimStruct        *S, 
                                          int_T            port, 
                                          const DimsInfo_T *dimsInfo)
{
 if (!ssSetOutputPortDimensionInfo(S, port, dimsInfo)) return;
}
#endif
#define MDL_SET_DEFAULT_PORT_DIMENSION_INFO
static void mdlSetDefaultPortDimensionInfo(SimStruct *S)
{
  DECL_AND_INIT_DIMSINFO(portDimsInfo);
  int_T dims[2] = { INPUT_0_WIDTH, 1 };
  bool  frameIn = ssGetInputPortFrameData(S, 0) == FRAME_YES;

  /* Neither the input nor the output ports have been set */

  portDimsInfo.width   = INPUT_0_WIDTH;
  portDimsInfo.numDims = frameIn ? 2 : 1;
  portDimsInfo.dims    = frameIn ? dims : &portDimsInfo.width;
  if (ssGetInputPortNumDimensions(S, 0) == (-1)) {  
   ssSetInputPortDimensionInfo(S, 0, &portDimsInfo);
  }
  portDimsInfo.width   = OUTPUT_0_WIDTH;
  dims[0]              = OUTPUT_0_WIDTH;
  dims[1]              = 1;
  portDimsInfo.dims    = frameIn ? dims : &portDimsInfo.width;
 if (ssGetOutputPortNumDimensions(S, 0) == (-1)) {  
  ssSetOutputPortDimensionInfo(S, 0, &portDimsInfo);
 }
  return;
}
# define MDL_SET_INPUT_PORT_FRAME_DATA
static void mdlSetInputPortFrameData(SimStruct  *S, 
                                     int_T      port,
                                     Frame_T    frameData)
{
    ssSetInputPortFrameData(S, port, frameData);
}
/* Function: mdlInitializeSampleTimes =========================================
 * Abstract:
 *    Specifiy  the sample time.
 */
static void mdlInitializeSampleTimes(SimStruct *S)
{
    ssSetSampleTime(S, 0, SAMPLE_TIME_0);
    ssSetOffsetTime(S, 0, 0.0);
}

#define MDL_SET_INPUT_PORT_DATA_TYPE
static void mdlSetInputPortDataType(SimStruct *S, int port, DTypeId dType)
{
    ssSetInputPortDataType( S, 0, dType);
}
#define MDL_SET_OUTPUT_PORT_DATA_TYPE
static void mdlSetOutputPortDataType(SimStruct *S, int port, DTypeId dType)
{
    ssSetOutputPortDataType(S, 0, dType);
}

#define MDL_SET_DEFAULT_PORT_DATA_TYPES
static void mdlSetDefaultPortDataTypes(SimStruct *S)
{
  ssSetInputPortDataType( S, 0, SS_DOUBLE);
 ssSetOutputPortDataType(S, 0, SS_DOUBLE);
}
/* Function: mdlOutputs =======================================================
 *
*/
static void mdlOutputs(SimStruct *S, int_T tid)
{

   int err, cur_time_int;
    time_T cur_time;
    kogmo_timestamp_t now;

    kogmo_rtdb_handle_t         *dbc;                   //PWORK 0
    kogmo_rtdb_connect_info_t   *dbinfo;                //PWORK 1

    kogmo_rtdb_obj_info_t       *objectinfo;            //PWORK 2
    kogmo_rtdb_objid_t          *objectid;              //PWORK 3
    obj_vibrowriststatus_t      *object;                //PWORK 4
    kogmo_rtdb_objsize_t        *objectlength;          //PWORK 5
    
    kogmo_rtdb_obj_info_t       *objectinfocmd;            //PWORK 6
    kogmo_rtdb_objid_t          *objectidcmd;              //PWORK 7
    obj_vibrowristcommand_t     *objectcmd;                //PWORK 8
    kogmo_rtdb_objsize_t        *objectlengthcmd;          //PWORK 9

    const real_T   *motor_cmd_1  = (const real_T*) ssGetInputPortSignal(S,0);
    const real_T   *motor_cmd_2  = (const real_T*) ssGetInputPortSignal(S,1);
    const real_T   *motor_cmd_3  = (const real_T*) ssGetInputPortSignal(S,2);
    const real_T   *motor_cmd_4  = (const real_T*) ssGetInputPortSignal(S,3);
    const boolean_T   *submit_cmd  = (const boolean_T*) ssGetInputPortSignal(S,4);
    
    real_T        *status  = (real_T *)ssGetOutputPortRealSignal(S,0);
    real_T        *age  = (real_T *)ssGetOutputPortRealSignal(S,1);

    
    if (ssGetPWorkValue(S, 10) != 0xDEADBEEF) {    
        dbinfo     = malloc(sizeof(kogmo_rtdb_connect_info_t));
        objectid   = malloc(sizeof(kogmo_rtdb_objid_t));
        objectinfo = malloc(sizeof(kogmo_rtdb_obj_info_t));
        object     = malloc(sizeof(obj_vibrowriststatus_t));
        objectlength = malloc(sizeof(kogmo_rtdb_objsize_t));
        
        objectidcmd   = malloc(sizeof(kogmo_rtdb_objid_t));
        objectinfocmd = malloc(sizeof(kogmo_rtdb_obj_info_t));
        objectcmd     = malloc(sizeof(obj_vibrowristcommand_t));
        objectlengthcmd = malloc(sizeof(kogmo_rtdb_objsize_t));
        
        struct sched_param nonrt_sched_param;
        nonrt_sched_param.sched_priority = 19;  /*sched_get_priority_max(SCHED_FIFO);*/
        if (sched_setscheduler( 0, SCHED_FIFO, &nonrt_sched_param)) {
         perror("setting scheduling mode");
         DIEonERR(0);
        }
         struct sigaction int_action, term_action, chld_action;
         sigaction(SIGINT, NULL, &int_action);
         sigaction(SIGTERM, NULL, &term_action);
         sigaction(SIGCHLD, NULL, &chld_action);
        
        err = kogmo_rtdb_connect_initinfo (dbinfo, "", "wearhap_device", 2); DIEonERR(err);
        dbinfo->flags = dbinfo->flags | KOGMO_RTDB_CONNECT_FLAGS_LIVEONERR;
        *objectid = kogmo_rtdb_connect (&dbc, dbinfo); DIEonERR(objectid);

        sigaction(SIGINT,  &int_action, NULL);
        sigaction(SIGTERM, &term_action, NULL);
        sigaction(SIGCHLD, &chld_action, NULL);
        nonrt_sched_param.sched_priority = 49;  /*sched_get_priority_max(SCHED_FIFO);*/
        if (sched_setscheduler( 0, SCHED_FIFO, &nonrt_sched_param)) {
         perror("setting scheduling mode");
         DIEonERR(0);
        }
        
        //pointers to PWORK
        ssSetPWorkValue(S, 0, dbc);
        ssSetPWorkValue(S, 1, dbinfo);
        ssSetPWorkValue(S, 2, objectinfo);
        ssSetPWorkValue(S, 3, objectid);
        ssSetPWorkValue(S, 4, object);    
        ssSetPWorkValue(S, 5, objectlength);    
        ssSetPWorkValue(S, 6, objectinfocmd);
        ssSetPWorkValue(S, 7, objectidcmd);
        ssSetPWorkValue(S, 8, objectcmd);    
        ssSetPWorkValue(S, 9, objectlengthcmd);     
        ssSetPWorkValue(S, 10, 0xDEADBEEF);
        ssSetPWorkValue(S, 11, 0);
    }
    // Start END -> Outputs

    
    dbc         = ssGetPWorkValue(S, 0);
    objectinfo  = ssGetPWorkValue(S, 2);
    objectid    = ssGetPWorkValue(S, 3);
    object      = ssGetPWorkValue(S, 4);
    objectinfocmd  = ssGetPWorkValue(S, 6);
    objectidcmd    = ssGetPWorkValue(S, 7);
    objectcmd      = ssGetPWorkValue(S, 8);
  
        
    static int count = 0;

    objectid[0] = kogmo_rtdb_obj_searchinfo(dbc, "VibrotactileWristStatus",
        TYPEID_VIBROWRIST_STATUS, 0, 0, 0, 0, 1);
    
    objectidcmd[0] = kogmo_rtdb_obj_searchinfo(dbc, "VibrotactileWristCommand",
        TYPEID_VIBROWRIST_COMMAND, 0, 0, 0, 0, 1);

    if ((objectid[0] < 0) || (objectidcmd[0] < 0)) {
        // object not found
        cur_time = ssGetT(S);
        cur_time_int = (int)(cur_time * 1000.0);
        if (cur_time_int % 1000 == 0) {
            printf("VibrotactileWristStatus or VibrotactileWristCommand not found!\n");
        }
        DIEonERR(0);
    } else {
       err = kogmo_rtdb_obj_readinfo (dbc, objectid[0], 0, objectinfo); DIEonERR(err);
       err = kogmo_rtdb_obj_readdata(dbc, objectid[0], 0, object, sizeof(obj_vibrowriststatus_t)); DIEonERR(err);

       err = kogmo_rtdb_obj_readinfo (dbc, objectidcmd[0], 0, objectinfocmd); DIEonERR(err);
       err = kogmo_rtdb_obj_readdata(dbc, objectidcmd[0], 0, objectcmd, sizeof(obj_vibrowristcommand_t)); DIEonERR(err);
       
       now = kogmo_timestamp_now();
       
       age[0] =  ((double)(now - object->base.committed_ts))/1000000000.0f;
       status[0] =  (double)object->vibrowriststatus.status.err;
        

       objectcmd->vibrowristcommand.pattern[0].T = motor_cmd_1[0];
       objectcmd->vibrowristcommand.pattern[0].ph= motor_cmd_1[1];
       objectcmd->vibrowristcommand.pattern[0].D = motor_cmd_1[2];
       objectcmd->vibrowristcommand.pattern[0].n = motor_cmd_1[3];
       
       objectcmd->vibrowristcommand.pattern[1].T = motor_cmd_2[0];
       objectcmd->vibrowristcommand.pattern[1].ph= motor_cmd_2[1];
       objectcmd->vibrowristcommand.pattern[1].D = motor_cmd_2[2];
       objectcmd->vibrowristcommand.pattern[1].n = motor_cmd_2[3];
       
       objectcmd->vibrowristcommand.pattern[2].T = motor_cmd_3[0];
       objectcmd->vibrowristcommand.pattern[2].ph= motor_cmd_3[1];
       objectcmd->vibrowristcommand.pattern[2].D = motor_cmd_3[2];
       objectcmd->vibrowristcommand.pattern[2].n = motor_cmd_3[3];
       
       objectcmd->vibrowristcommand.pattern[3].T = motor_cmd_4[0];
       objectcmd->vibrowristcommand.pattern[3].ph= motor_cmd_4[1];
       objectcmd->vibrowristcommand.pattern[3].D = motor_cmd_4[2];
       objectcmd->vibrowristcommand.pattern[3].n = motor_cmd_4[3];

        
       unsigned int i=0;
       for (i=0; i<4; i++){
            if (objectcmd->vibrowristcommand.pattern[i].T>2.55) objectcmd->vibrowristcommand.pattern[i].T = 2.55;
            if (objectcmd->vibrowristcommand.pattern[i].T<0) objectcmd->vibrowristcommand.pattern[i].T = 0;
            if (objectcmd->vibrowristcommand.pattern[i].ph>2.55) objectcmd->vibrowristcommand.pattern[i].ph = 2.55;
            if (objectcmd->vibrowristcommand.pattern[i].ph<0) objectcmd->vibrowristcommand.pattern[i].ph = 0;
            if (objectcmd->vibrowristcommand.pattern[i].D>100) objectcmd->vibrowristcommand.pattern[i].D = 100;
            if (objectcmd->vibrowristcommand.pattern[i].D<0) objectcmd->vibrowristcommand.pattern[i].D = 0;        
            if (objectcmd->vibrowristcommand.pattern[i].n>255) objectcmd->vibrowristcommand.pattern[i].n = 255;
            if (objectcmd->vibrowristcommand.pattern[i].n<0) objectcmd->vibrowristcommand.pattern[i].n = 0;        
     }


        //if( ((unsigned int)ssGetPWorkValue(S, 11)) % 1 == 0) 
        //printf("ssGetPWorkValue(S, 11)%1000, %d  OID: %d,  SAMPLE_TIME: %f \n", ((unsigned int)ssGetPWorkValue(S, 11))%1000, objectinfocmd->oid, SAMPLE_TIME_0  );
        ssSetPWorkValue(S,11,(unsigned int)ssGetPWorkValue(S,11)+1);
        if (submit_cmd[0] == true){
            err = kogmo_rtdb_obj_writedata (dbc, objectinfocmd->oid, objectcmd); DIEonERR(err);
        }
    }
    err = kogmo_rtdb_cycle_done (dbc, 0); DIEonERR(err);  
}



/* Function: mdlTerminate =====================================================
 * Abstract:
 *    In this function, you should perform any actions that are necessary
 *    at the termination of a simulation.  For example, if memory was
 *    allocated in mdlStart, this is the place to free it.
 */
/* Function: mdlTerminate =====================================================
 * Abstract:
 *    In this function, you should perform any actions that are necessary
 *    at the termination of a simulation.  For example, if memory was
 *    allocated in mdlStart, this is the place to free it.
 */
static void mdlTerminate(SimStruct *S)
{
    if (ssGetPWorkValue(S, 10) == 0xDEADBEEF) {

        int err;
        void *pwork;

        kogmo_rtdb_handle_t         *dbc;                   //PWORK 0
        kogmo_rtdb_connect_info_t   *dbinfo;                //PWORK 1

        kogmo_rtdb_obj_info_t       *objectinfo;            //PWORK 2
        kogmo_rtdb_objid_t          *objectid;              //PWORK 3
        obj_vibrowriststatus_t      *object;                //PWORK 4
        kogmo_rtdb_objsize_t        *objectlength;          //PWORK 5

        kogmo_rtdb_obj_info_t       *objectinfocmd;         //PWORK 6
        kogmo_rtdb_objid_t          *objectidcmd;           //PWORK 7
        obj_vibrowristcommand_t     *objectcmd;             //PWORK 8
        kogmo_rtdb_objsize_t        *objectlengthcmd;       //PWORK 9
        
        dbc         = ssGetPWorkValue(S, 0);
        dbinfo      = ssGetPWorkValue(S, 1);
        objectinfo  = ssGetPWorkValue(S, 2);
        objectid    = ssGetPWorkValue(S, 3);
        object      = ssGetPWorkValue(S, 4);
        objectlength= ssGetPWorkValue(S, 5);
        objectinfocmd=ssGetPWorkValue(S, 6);
        objectidcmd=  ssGetPWorkValue(S, 7);
        objectcmd=    ssGetPWorkValue(S, 8);
        objectlengthcmd=ssGetPWorkValue(S, 9);


        struct sched_param nonrt_sched_param;
        nonrt_sched_param.sched_priority = 19;  /*sched_get_priority_max(SCHED_FIFO);*/
            if (sched_setscheduler( 0, SCHED_FIFO, &nonrt_sched_param)) {
             perror("setting scheduling mode");
             DIEonERR(0);
        }

        //err = kogmo_rtdb_obj_delete (dbc, objectinfo); DIEonERR(err);
        err = kogmo_rtdb_disconnect (dbc, NULL); DIEonERR(err);

        free(dbinfo);
        free(objectid);
        free(objectinfo);
        free(object);
        free(objectlength);
        free(objectidcmd);
        free(objectcmd);
        free(objectlengthcmd);
        free(objectinfocmd);
    }
}
#ifdef  MATLAB_MEX_FILE    /* Is this file being compiled as a MEX-file? */
#include "simulink.c"      /* MEX-file interface mechanism */
#else
#include "cg_sfun.h"       /* Code generation registration function */
#endif

