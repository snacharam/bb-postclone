DECLARE
   l_responsibility_id   number;
   l_application_id      number;
   l_user_id             number;
   l_request_id          number; 
   l_request_set_exist   BOOLEAN := FALSE;
   l_CONC_PROG_SUBMIT    BOOLEAN := FALSE;
   L_INSTANCE_NAME      VARCHAR2(30);

   CURSOR orgs_c
   IS
      SELECT   *
        FROM   (SELECT   'US' org_id,
                         20003 application_id,
                         51007 responsibility_id,
                         11562 user_id
                  FROM   DUAL
                UNION
                SELECT   'UK',
                         20003 application_id,
                         52050 responsibility_id,
                         11562 user_id
                  FROM   DUAL
                UNION
                SELECT   'CA',
                         20003 application_id,
                         51866 responsibility_id,
                         11562 user_id
                  FROM   DUAL);

   CURSOR concurrent_jobs_c
   IS
     SELECT   *
        FROM   fnd_concurrent_programs_vl
       WHERE   user_concurrent_program_name  in
                    ('PP EBS to By Design Order Extract(Wrapper Program)',
                    'PP ONT Create Continuity Orders',
                    'PP Load Bonus Attributes',
                    'PP Continuity Book Orders Process'); 

   CURSOR req_c (
      p_max_request             IN            number,
      p_concurrent_program_id   IN            number,
      p_responsibility_id       IN            number
   )
   IS
      SELECT   *
        FROM   fnd_concurrent_requests
       WHERE       request_id = p_max_request
               AND concurrent_program_id = p_concurrent_program_id
               AND responsibility_id = p_responsibility_id;

   l_req_int_time        number;
   l_max_request_id      number;
   cc_hold_flag          varchar2 (25);
   l_boolean             boolean;
PROCEDURE PP_OM_BATCH_AUTH
AS
   V_REQUEST_SET_EXIST   BOOLEAN := FALSE;
   req_id                INTEGER := 0;
   l_CONC_PROG_SUBMIT    BOOLEAN := FALSE;
   srs_failed            EXCEPTION;
   submitprog_failed     EXCEPTION;
   submitset_failed      EXCEPTION;
   l_start_date          VARCHAR2 (250);
   l_boolean             boolean;
   l_req_data            VARCHAR2 (10);
   l_wait_for_req        BOOLEAN;
   l_phase               VARCHAR2 (100);
   l_status              VARCHAR2 (100);
   l_dev_phase           VARCHAR2 (100);
   l_dev_status          VARCHAR2 (100);
   l_message             VARCHAR2 (4000);
   
    CURSOR orgs_c
   IS
      SELECT   *
        FROM   (SELECT   'US' org_id,
                         20003 application_id,
                         51007 responsibility_id,
                         11562 user_id
                  FROM   DUAL
                UNION
                SELECT   'UK',
                         20003 application_id,
                         52050 responsibility_id,
                         11562 user_id
                  FROM   DUAL
                UNION
                SELECT   'CA',
                         20003 application_id,
                         51866 responsibility_id,
                         11562 user_id
                  FROM   DUAL);
PROCEDURE PP_PICKING_UNRELEASED
AS
   V_REQUEST_SET_EXIST   BOOLEAN := FALSE;
   req_id                INTEGER := 0;
   l_CONC_PROG_SUBMIT    BOOLEAN := FALSE;
   srs_failed            EXCEPTION;
   submitprog_failed     EXCEPTION;
   submitset_failed      EXCEPTION;
   l_start_date          VARCHAR2 (250);
   l_boolean             boolean;
   l_req_data            VARCHAR2 (10);
   l_wait_for_req        BOOLEAN;
   l_phase               VARCHAR2 (100);
   l_status              VARCHAR2 (100);
   l_dev_phase           VARCHAR2 (100);
   l_dev_status          VARCHAR2 (100);
   l_message             VARCHAR2 (4000);
   
    CURSOR orgs_c
   IS
      SELECT   *
        FROM   (SELECT   'US' org_id,
                         20003 application_id,
                         51007 responsibility_id,
                         11562 user_id
                  FROM   DUAL
                UNION
                SELECT   'UK',
                         20003 application_id,
                         52050 responsibility_id,
                         11562 user_id
                  FROM   DUAL
                UNION
                SELECT   'CA',
                         20003 application_id,
                         51866 responsibility_id,
                         11562 user_id
                  FROM   DUAL);
PROCEDURE PP_PICKING_BACKORDER_STD
AS
   V_REQUEST_SET_EXIST   BOOLEAN := FALSE;
   req_id                INTEGER := 0;
   l_CONC_PROG_SUBMIT    BOOLEAN := FALSE;
   srs_failed            EXCEPTION;
   submitprog_failed     EXCEPTION;
   submitset_failed      EXCEPTION;
   l_start_date          VARCHAR2 (250);
   l_boolean             boolean;
   l_req_data            VARCHAR2 (10);
   l_wait_for_req        BOOLEAN;
   l_phase               VARCHAR2 (100);
   l_status              VARCHAR2 (100);
   l_dev_phase           VARCHAR2 (100);
   l_dev_status          VARCHAR2 (100);
   l_message             VARCHAR2 (4000);
   
    CURSOR orgs_c
   IS
      SELECT   *
        FROM   (SELECT   'US' org_id,
                         20003 application_id,
                         51007 responsibility_id,
                         11562 user_id
                  FROM   DUAL
                UNION
                SELECT   'UK',
                         20003 application_id,
                         52050 responsibility_id,
                         11562 user_id
                  FROM   DUAL
                UNION
                SELECT   'CA',
                         20003 application_id,
                         51866 responsibility_id,
                         11562 user_id
                  FROM   DUAL);
PROCEDURE PP_ORDER_IMPORT
AS
   V_REQUEST_SET_EXIST   BOOLEAN := FALSE;
   req_id                INTEGER := 0;
   l_CONC_PROG_SUBMIT    BOOLEAN := FALSE;
   srs_failed            EXCEPTION;
   submitprog_failed     EXCEPTION;
   submitset_failed      EXCEPTION;
   l_start_date          VARCHAR2 (250);
   l_boolean             boolean;
   l_req_data            VARCHAR2 (10);
   l_wait_for_req        BOOLEAN;
   l_phase               VARCHAR2 (100);
   l_status              VARCHAR2 (100);
   l_dev_phase           VARCHAR2 (100);
   l_dev_status          VARCHAR2 (100);
   l_message             VARCHAR2 (4000);
   
    CURSOR orgs_c
   IS
      SELECT   *
        FROM   (SELECT   'US' org_id,
                         20003 application_id,
                         51007 responsibility_id,
                         11562 user_id
                  FROM   DUAL
                UNION
                SELECT   'UK',
                         20003 application_id,
                         52050 responsibility_id,
                         11562 user_id
                  FROM   DUAL
                UNION
                SELECT   'CA',
                         20003 application_id,
                         51866 responsibility_id,
                         11562 user_id
                  FROM   DUAL);
                  
BEGIN

   FOR v_orgs_c IN orgs_c
   LOOP
-- fnd_global.apps_initialize (36923, 21623, 660); 

 apps.fnd_global.apps_initialize (
                     v_orgs_c.user_id,
                     v_orgs_c.responsibility_id,
                     v_orgs_c.application_id
                  );
                  
 IF v_orgs_c.org_id = 'US'
                  THEN
                     --periodically submitting concurrent programs

                     l_boolean :=
                        fnd_submit.set_repeat_options (
                           --repeat_time     => '14:10:00'--to_char(sysdate,'hh24:mi:ss'),
                           repeat_interval   => 15,
                           repeat_unit       => 'MINUTES',
                           repeat_type       => 'END',
                           repeat_end_time   => SYSDATE + 45
                        );
                  ELSIF v_orgs_c.org_id = 'CA'
                  THEN
                     --periodically submitting concurrent programs

                     l_boolean :=
                        fnd_submit.set_repeat_options (
                           --repeat_time     => '14:10:00'--to_char(sysdate,'hh24:mi:ss'),
                           repeat_interval   => 30,
                           repeat_unit       => 'MINUTES',
                           repeat_type       => 'END',
                           repeat_end_time   => SYSDATE + 45
                        );
                  ELSIF v_orgs_c.org_id = 'UK'
                  THEN
                     --periodically submitting concurrent programs

                     l_boolean :=
                        fnd_submit.set_repeat_options (
                           --repeat_time     => '14:10:00'--to_char(sysdate,'hh24:mi:ss'),
                           repeat_interval   => 60,
                           repeat_unit       => 'MINUTES',
                           repeat_type       => 'END',
                           repeat_end_time   => SYSDATE + 45
                        );
                  END IF;                  
 
---------------------------------
-- Request Set 'PP Order Import'
---------------------------------  
                 
                  
                  V_REQUEST_SET_EXIST :=
                                       FND_SUBMIT.set_request_set (application =>  'XXDAZ',        
                                                                   request_set => 'XXDAZ_ORDER_IMPORT');
                                                                   
 IF (NOT V_REQUEST_SET_EXIST)
   THEN
      RAISE srs_failed;
   END IF;                                                               
                       
            DBMS_OUTPUT.put_line ('Calling submit program First stage');
            
                  l_conc_prog_submit :=
                                           fnd_submit.submit_program ('XXDAZ',  -- Application short name
                                                                      'XXDAZ_BATCH_ORDER_IMPORT', -- Concurrent program shot name
                                                                      'PP_BOI', -- Stage
                                                                       NULL,
                                                                       NULL,
                                                                       NULL,
                                                                       'N',
                                                                        5,
                                                                       'N'
         );
                                                                     
       IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;                                                                 
                  
                  
        DBMS_OUTPUT.put_line ('Calling submit program second stage');

                  l_conc_prog_submit :=
                                         fnd_submit.submit_program ('ONT',              -- Application short name
                                                                    'OEOIMP',     -- Concurrent program shot name
                                                                    'Order Import',                           -- Stage
                                                                     NULL,
                                                                     NULL,
                                                                     NULL,
                                                                     NULL,
                                                                     'N',
                                                                      1,
                                                                      5,
                                                                     NULL,
                                                                     NULL,
                                                                     NULL,
                                                                     'Y',
                                                                     'N',
                                                                     'Y',
                                                                     NULL,
                                                                     'Y'
                                                                     ); 

   IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;                                                                    
       
         DBMS_OUTPUT.put_line ('Calling submit program Third stage');
 
                 l_conc_prog_submit :=
                                         fnd_submit.submit_program ('XXDAZ',              -- Application short name
                                                                    'XXDAZ_UPDATE_ACH',     -- Concurrent program shot name
                                                                    'ACH Payment update'                           -- Stage
                                                                     );
                                                                   
       IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;                                                               

        DBMS_OUTPUT.put_line ('Calling submit program Fourth stage');

                l_conc_prog_submit :=
                                         fnd_submit.submit_program ('XXPP',              -- Application short name
                                                                    'XXPP_PERSONAL_USE_CNT',     -- Concurrent program shot name
                                                                    'PERSONAL_USE'                           -- Stage
                                                                    ); 
    
   IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;    

  DBMS_OUTPUT.PUT_LINE (  'Calling submit_set');

   SELECT TO_CHAR (SYSDATE, 'DD-MON-YYYY HH24:MI:SS')
     INTO l_start_date
     FROM DUAL;

   req_id :=
      FND_SUBMIT.submit_set (start_time => l_start_date, sub_request => FALSE);

   IF (req_id = 0)
   THEN
      RAISE submitset_failed;
   END IF;
   
   l_wait_for_req :=
         fnd_concurrent.wait_for_request (request_id   => req_id,
                                          interval     => 2,
                                          max_wait     => 5,
                                          phase        => l_phase,
                                          status       => l_status,
                                          dev_phase    => l_dev_phase,
                                          dev_status   => l_dev_status,
                                          message      => l_message);  

   END LOOP;
   
EXCEPTION
   WHEN srs_failed
   THEN
   DBMS_OUTPUT.PUT_LINE ( 'Call to set_request_set failed: '  || fnd_message.get );
   WHEN submitprog_failed
   THEN
DBMS_OUTPUT.PUT_LINE ( 'Call to submit_program failed: '  || fnd_message.get );
   WHEN submitset_failed
   THEN
DBMS_OUTPUT.PUT_LINE (  'Call to submit_set failed: '   || fnd_message.get );
   WHEN OTHERS
   THEN
DBMS_OUTPUT.PUT_LINE (   'Request set submission failed – unknown error: ' || SQLERRM);
END PP_ORDER_IMPORT;                   
BEGIN

   FOR v_orgs_c IN orgs_c
   LOOP
-- fnd_global.apps_initialize (36923, 21623, 660); 

 apps.fnd_global.apps_initialize (
                     v_orgs_c.user_id,
                     v_orgs_c.responsibility_id,
                     v_orgs_c.application_id
                  );
                  
 IF v_orgs_c.org_id = 'US'
                  THEN
                     --periodically submitting concurrent programs

                     l_boolean :=
                        fnd_submit.set_repeat_options (
                           --repeat_time     => '14:10:00'--to_char(sysdate,'hh24:mi:ss'),
                           repeat_interval   => 15,
                           repeat_unit       => 'MINUTES',
                           repeat_type       => 'END',
                           repeat_end_time   => SYSDATE + 45
                        );
                  ELSIF v_orgs_c.org_id = 'CA'
                  THEN
                     --periodically submitting concurrent programs

                     l_boolean :=
                        fnd_submit.set_repeat_options (
                           --repeat_time     => '14:10:00'--to_char(sysdate,'hh24:mi:ss'),
                           repeat_interval   => 30,
                           repeat_unit       => 'MINUTES',
                           repeat_type       => 'END',
                           repeat_end_time   => SYSDATE + 45
                        );
                  ELSIF v_orgs_c.org_id = 'UK'
                  THEN
                     --periodically submitting concurrent programs

                     l_boolean :=
                        fnd_submit.set_repeat_options (
                           --repeat_time     => '14:10:00'--to_char(sysdate,'hh24:mi:ss'),
                           repeat_interval   => 60,
                           repeat_unit       => 'MINUTES',
                           repeat_type       => 'END',
                           repeat_end_time   => SYSDATE + 45
                        );
                  END IF;                  
 
------------------------------------------------
-- Request Set 'PP Picking Process Set-Backorder-STD Multi Threaded'
------------------------------------------------  
                 
                  
                  V_REQUEST_SET_EXIST :=
                                       FND_SUBMIT.set_request_set (application =>  'XXDAZ',        
                                                                   request_set => 'FNDRSSUB2861');
                                                                   
 IF (NOT V_REQUEST_SET_EXIST)
   THEN
      RAISE srs_failed;
   END IF;                                                               
                       
            DBMS_OUTPUT.put_line ('Calling submit program First stage');
            
                  l_conc_prog_submit :=
                                           fnd_submit.submit_program ('XXDAZ',  -- Application short name
                                                                      'XXDAZ_ONT_BO_RELEASE_PROCESS', -- Concurrent program shot name
                                                                      'STAGE10' -- Stage
         );
                                                                     
       IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;                                                                 
                  
                  
        DBMS_OUTPUT.put_line ('Calling submit program second stage');

                  l_conc_prog_submit :=
                                         fnd_submit.submit_program ('XXPP',              -- Application short name
                                                                    'XXDAZ_WSH_PICK_RELEASE_MTSMAIN',     -- Concurrent program shot name
                                                                    'STAGE20',                           -- Stage
                                                                    'B',  --parameter for concurrent program
                                                                    '5000'
                                                                     ); 

   IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;                                                                    
       
         DBMS_OUTPUT.put_line ('Calling submit program Third stage');
 
                 l_conc_prog_submit :=
                                         fnd_submit.submit_program ('XXDAZ',              -- Application short name
                                                                    'XXDAZ_WSH_SUBMIT_PKREL_MTSTD',     -- Concurrent program shot name
                                                                    'STAGE30',                           -- Stage
                                                                     'O'  --parameter for concurrent program
                                                                     );
                                                                   
       IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;                                                               

        DBMS_OUTPUT.put_line ('Calling submit program Fourth stage');

                l_conc_prog_submit :=
                                         fnd_submit.submit_program ('XXDAZ',              -- Application short name
                                                                    'XXDAZ_ONT_BO_HOLD_PROCESS',     -- Concurrent program shot name
                                                                    'STAGE40',                           -- Stage
                                                                    7
                                                                    ); 
    
   IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;    
   
 DBMS_OUTPUT.put_line ('Calling submit program Fifth stage');
                     l_conc_prog_submit :=
                                          fnd_submit.submit_program ('XXPP',              -- Application short name
                                                                     'XXPP_EMPTYBOX_BACKORDER_PRG',     -- Concurrent program shot name
                                                                     'STAGE50'                           -- Stage
                                                                      );
    
   IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;    

DBMS_OUTPUT.put_line ('Calling submit program Sixth stage');
                    l_conc_prog_submit :=
                                        fnd_submit.submit_program ('XXDAZ',              -- Application short name
                                                                   'XXPP_3PL_OUTBOUND',     -- Concurrent program shot name
                                                                   'STAGE60',                           -- Stage
                                                                    NULL,  --parameter for concurrent program
                                                                    'N'
                                                                    );  
                                                                  
   IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;                                                                  
            
     
  
   

  DBMS_OUTPUT.PUT_LINE (  'Calling submit_set');

   SELECT TO_CHAR (SYSDATE, 'DD-MON-YYYY HH24:MI:SS')
     INTO l_start_date
     FROM DUAL;

   req_id :=
      FND_SUBMIT.submit_set (start_time => l_start_date, sub_request => FALSE);

   IF (req_id = 0)
   THEN
      RAISE submitset_failed;
   END IF;
   
   l_wait_for_req :=
         fnd_concurrent.wait_for_request (request_id   => req_id,
                                          interval     => 2,
                                          max_wait     => 5,
                                          phase        => l_phase,
                                          status       => l_status,
                                          dev_phase    => l_dev_phase,
                                          dev_status   => l_dev_status,
                                          message      => l_message);  

   END LOOP;
   
   PP_ORDER_IMPORT;
EXCEPTION
   WHEN srs_failed
   THEN
   DBMS_OUTPUT.PUT_LINE ( 'Call to set_request_set failed: '  || fnd_message.get );
   WHEN submitprog_failed
   THEN
DBMS_OUTPUT.PUT_LINE ( 'Call to submit_program failed: '  || fnd_message.get );
   WHEN submitset_failed
   THEN
DBMS_OUTPUT.PUT_LINE (  'Call to submit_set failed: '   || fnd_message.get );
   WHEN OTHERS
   THEN
DBMS_OUTPUT.PUT_LINE (   'Request set submission failed – unknown error: ' || SQLERRM);
END PP_PICKING_BACKORDER_STD;                  
                  
BEGIN

   FOR v_orgs_c IN orgs_c
   LOOP
-- fnd_global.apps_initialize (36923, 21623, 660); 

 apps.fnd_global.apps_initialize (
                     v_orgs_c.user_id,
                     v_orgs_c.responsibility_id,
                     v_orgs_c.application_id
                  );
                  
 IF v_orgs_c.org_id = 'US'
                  THEN
                     --periodically submitting concurrent programs

                     l_boolean :=
                        fnd_submit.set_repeat_options (
                           --repeat_time     => '14:10:00'--to_char(sysdate,'hh24:mi:ss'),
                           repeat_interval   => 15,
                           repeat_unit       => 'MINUTES',
                           repeat_type       => 'END',
                           repeat_end_time   => SYSDATE + 45
                        );
                  ELSIF v_orgs_c.org_id = 'CA'
                  THEN
                     --periodically submitting concurrent programs

                     l_boolean :=
                        fnd_submit.set_repeat_options (
                           --repeat_time     => '14:10:00'--to_char(sysdate,'hh24:mi:ss'),
                           repeat_interval   => 30,
                           repeat_unit       => 'MINUTES',
                           repeat_type       => 'END',
                           repeat_end_time   => SYSDATE + 45
                        );
                  ELSIF v_orgs_c.org_id = 'UK'
                  THEN
                     --periodically submitting concurrent programs

                     l_boolean :=
                        fnd_submit.set_repeat_options (
                           --repeat_time     => '14:10:00'--to_char(sysdate,'hh24:mi:ss'),
                           repeat_interval   => 60,
                           repeat_unit       => 'MINUTES',
                           repeat_type       => 'END',
                           repeat_end_time   => SYSDATE + 45
                        );
                  END IF;                  
 
------------------------------------------------
-- Request Set 'PP Picking Process Set-Unreleased New'
------------------------------------------------  
                 
                  
                  V_REQUEST_SET_EXIST :=
                                       FND_SUBMIT.set_request_set (application =>  'ONT',        
                                                                   request_set => 'FNDRSSUB2860');  --'FNDRSSUB794');
                                                                   
       IF (NOT V_REQUEST_SET_EXIST)
   THEN
      RAISE srs_failed;
   END IF;                                                               
                       
            DBMS_OUTPUT.put_line ('Calling submit program First stage');
            
                  l_conc_prog_submit :=
                                        fnd_submit.submit_program ('XXDAZ',  -- Application short name
                                                                   'XXDAZ_WSH_PICK_RELEASE_MTSMAIN',--'XXDAZ_WSH_PICK_RELEASE_MAIN', -- Concurrent program shot name
                                                                   'STAGE10', -- Stage
                                                                   'R', --parameter for concurrent program
                                                                   '1000' -- --parameter for concurrent program
                                                                     );
                                                                     
       IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;                                                                 
                  
                  
        DBMS_OUTPUT.put_line ('Calling submit program second stage');

                  l_conc_prog_submit :=
                                        fnd_submit.submit_program ('XXDAZ',              -- Application short name
                                                                   'XXDAZ_WSH_SUBMIT_PKREL_MTSTD',--'XXDAZ_WSH_SUBMIT_PICK_RELEASE',     -- Concurrent program shot name
                                                                   'STAGE20',                           -- Stage
                                                                   'E'  --parameter for concurrent program
                                                                    );  

   IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;                                                                    
       
         DBMS_OUTPUT.put_line ('Calling submit program Third stage');
 
                  l_conc_prog_submit :=
                                       fnd_submit.submit_program ('WSH',              -- Application short name
                                                                  'WSHPSRS',     -- Concurrent program shot name
                                                                  'STAGE30',                           -- Stage
                                                                  '143',  --parameter for concurrent program
                                                                  NULL,
                                                                  0,
																  NULL,
																  SYSDATE
                                                                   );
                                                                   
       IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;                                                               

        DBMS_OUTPUT.put_line ('Calling submit program Fourth stage');

                  l_conc_prog_submit :=
                                       fnd_submit.submit_program ('XXPP',              -- Application short name
                                                                  'XXPP_EMPTYBOX_BACKORDER_PRG',     -- Concurrent program shot name
                                                                  'STAGE40'                           -- Stage
                                                                   );
    
   IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;    

        DBMS_OUTPUT.put_line ('Calling submit program Fifth stage');

                   l_conc_prog_submit :=
                                      fnd_submit.submit_program ('XXDAZ',              -- Application short name
                                                                 'XXPP_3PL_OUTBOUND',     -- Concurrent program shot name
                                                                 'STAGE50',                           -- Stage
                                                                  NULL,  --parameter for concurrent program
                                                                 'N'
                                                                  );    
                                                                  
   IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;                                                                                      
                                       


  DBMS_OUTPUT.PUT_LINE (  'Calling submit_set');

   SELECT TO_CHAR (SYSDATE, 'DD-MON-YYYY HH24:MI:SS')
     INTO l_start_date
     FROM DUAL;

   req_id :=
      FND_SUBMIT.submit_set (start_time => l_start_date, sub_request => FALSE);

   IF (req_id = 0)
   THEN
      RAISE submitset_failed;
   END IF;
   
    l_wait_for_req :=
         fnd_concurrent.wait_for_request (request_id   => req_id,
                                          interval     => 2,
                                          max_wait     => 5,
                                          phase        => l_phase,
                                          status       => l_status,
                                          dev_phase    => l_dev_phase,
                                          dev_status   => l_dev_status,
                                          message      => l_message);
                                          
   END LOOP;
   PP_PICKING_BACKORDER_STD;
EXCEPTION
   WHEN srs_failed
   THEN
   DBMS_OUTPUT.PUT_LINE ( 'Call to set_request_set failed: '  || fnd_message.get );
   WHEN submitprog_failed
   THEN
DBMS_OUTPUT.PUT_LINE ( 'Call to submit_program failed: '  || fnd_message.get );
   WHEN submitset_failed
   THEN
DBMS_OUTPUT.PUT_LINE (  'Call to submit_set failed: '   || fnd_message.get );
   WHEN OTHERS
   THEN
DBMS_OUTPUT.PUT_LINE (   'Request set submission failed – unknown error: ' || SQLERRM);
END PP_PICKING_UNRELEASED;                   
                  
BEGIN

   FOR v_orgs_c IN orgs_c
   LOOP
-- fnd_global.apps_initialize (36923, 21623, 660); 

 apps.fnd_global.apps_initialize (
                     v_orgs_c.user_id,
                     v_orgs_c.responsibility_id,
                     v_orgs_c.application_id
                  );
                  
 IF v_orgs_c.org_id = 'US'
                  THEN
                     --periodically submitting concurrent programs

                     l_boolean :=
                        fnd_submit.set_repeat_options (
                           --repeat_time     => '14:10:00'--to_char(sysdate,'hh24:mi:ss'),
                           repeat_interval   => 15,
                           repeat_unit       => 'MINUTES',
                           repeat_type       => 'END',
                           repeat_end_time   => SYSDATE + 45
                        );
                  ELSIF v_orgs_c.org_id = 'CA'
                  THEN
                     --periodically submitting concurrent programs

                     l_boolean :=
                        fnd_submit.set_repeat_options (
                           --repeat_time     => '14:10:00'--to_char(sysdate,'hh24:mi:ss'),
                           repeat_interval   => 30,
                           repeat_unit       => 'MINUTES',
                           repeat_type       => 'END',
                           repeat_end_time   => SYSDATE + 45
                        );
                  ELSIF v_orgs_c.org_id = 'UK'
                  THEN
                     --periodically submitting concurrent programs

                     l_boolean :=
                        fnd_submit.set_repeat_options (
                           --repeat_time     => '14:10:00'--to_char(sysdate,'hh24:mi:ss'),
                           repeat_interval   => 60,
                           repeat_unit       => 'MINUTES',
                           repeat_type       => 'END',
                           repeat_end_time   => SYSDATE + 45
                        );
                  END IF;                  
 
                                                             
------------------------------------------------
-- Request Set 'PP OM Batch Authorization(New)'
------------------------------------------------  
                  
                   V_REQUEST_SET_EXIST :=
                                         FND_SUBMIT.set_request_set (application =>  'XXPP',        
                                                                     request_set => 'FNDRSSUB1180');
                                                                     
IF (NOT V_REQUEST_SET_EXIST)
   THEN
      RAISE srs_failed;
   END IF;                                                                     
                  
   DBMS_OUTPUT.put_line ('Calling submit program First stage');
          
            l_conc_prog_submit :=
                               fnd_submit.submit_program ('XXPP',  -- Application short name
                                                          'XXDAZ_AUTH_CAPTURE_NEW', -- Concurrent program shot name
                                                          'STAGE10' -- Stage
                                                          );
         
         COMMIT;   
                                                                  
   IF (NOT l_CONC_PROG_SUBMIT)
   THEN
      RAISE submitprog_failed;
   END IF;                                                                                      
                                       


  DBMS_OUTPUT.PUT_LINE (  'Calling submit_set');

   SELECT TO_CHAR (SYSDATE, 'DD-MON-YYYY HH24:MI:SS')
     INTO l_start_date
     FROM DUAL;

   req_id :=
      FND_SUBMIT.submit_set (start_time => l_start_date, sub_request => FALSE);

   IF (req_id = 0)
   THEN
      RAISE submitset_failed;
   END IF;
   
    l_wait_for_req :=
         fnd_concurrent.wait_for_request (request_id   => req_id,
                                          interval     => 2,
                                          max_wait     => 5,
                                          phase        => l_phase,
                                          status       => l_status,
                                          dev_phase    => l_dev_phase,
                                          dev_status   => l_dev_status,
                                          message      => l_message);
                                          
   END LOOP;
   PP_PICKING_UNRELEASED;
EXCEPTION
   WHEN srs_failed
   THEN
   DBMS_OUTPUT.PUT_LINE ( 'Call to set_request_set failed: '  || fnd_message.get );
   WHEN submitprog_failed
   THEN
DBMS_OUTPUT.PUT_LINE ( 'Call to submit_program failed: '  || fnd_message.get );
   WHEN submitset_failed
   THEN
DBMS_OUTPUT.PUT_LINE (  'Call to submit_set failed: '   || fnd_message.get );
   WHEN OTHERS
   THEN
DBMS_OUTPUT.PUT_LINE (   'Request set submission failed – unknown error: ' || SQLERRM);
END PP_OM_BATCH_AUTH;

BEGIN
--------------
-- Instance
--------------
BEGIN
   SELECT instance_name INTO l_instance_name FROM v$instance;
END;

																		 

--------------
-- DVTMEBS
--------------
IF  l_instance_name = 'DVTMEBS'
THEN
---------------------------------------------------------
--Disable Fraud Check for CS_NT and WEB_NT order types
---------------------------------------------------------
                     update fnd_lookup_values set ENABLED_FLAG = 'N'
                              where lookup_type = 'XXPP_FRAUD_CHECK_ORDER_TYPES'
                               and (lookup_code like 'CS ORDER_NT%' or lookup_code like 'WEB ORDER_NT%')
                                and ENABLED_FLAG = 'Y';
--------------------------------------------------------------------------------------------
--Remove start date from pricelist line if start date is in future and Excluded Modifiers
--------------------------------------------------------------------------------------------
                     update qp_list_lines set START_DATE_ACTIVE = NULL
                           where START_DATE_ACTIVE > sysdate and LIST_LINE_TYPE_CODE <> 'DIS'; 

commit;

   FOR v_orgs_c IN orgs_c
   LOOP
      FOR v_concurrent_jobs_c IN concurrent_jobs_c
      LOOP
         cc_hold_flag := 'N';



         BEGIN
            SELECT   MAX (request_id)
              INTO   l_max_request_id
              FROM   fnd_concurrent_requests
             WHERE   status_code = 'I'
                     AND concurrent_program_id =
                           v_concurrent_jobs_c.concurrent_program_id
                     AND responsibility_id = v_orgs_c.responsibility_id;


            IF l_max_request_id IS NOT NULL
            THEN
               cc_hold_flag := 'Y';
            ELSE
               cc_hold_flag := 'N';
            END IF;



            UPDATE   fnd_concurrent_requests a
               SET   hold_flag = 'N',
                     last_update_date = SYSDATE,
                     last_updated_by = -1
             WHERE   request_id = l_max_request_id;

            COMMIT;
         EXCEPTION
            WHEN OTHERS
            THEN
               cc_hold_flag := 'N';
         END;

         DBMS_OUTPUT.put_line (
            v_orgs_c.org_id || '     : ' || l_max_request_id
         );

         IF cc_hold_flag = 'N'
         THEN
            BEGIN
               SELECT   MAX (request_id)
                 INTO   l_max_request_id
                 FROM   fnd_concurrent_requests
                WHERE   concurrent_program_id =
                           v_concurrent_jobs_c.concurrent_program_id
                        AND responsibility_id = v_orgs_c.responsibility_id;
            EXCEPTION
               WHEN OTHERS
               THEN
                  DBMS_OUTPUT.put_line (
                     'No Current Request Found to submit Data Error '
                  );
            END;

/*
            FOR v_req
            IN req_c (l_max_request_id,
                      v_concurrent_jobs_c.concurrent_program_id,
                      v_orgs_c.responsibility_id)
            LOOP*/
               BEGIN
                  --
                  --to set environment context.
                  --
                  apps.fnd_global.apps_initialize (
                     v_orgs_c.user_id,
                     v_orgs_c.responsibility_id,
                     v_orgs_c.application_id
                  );



                  IF v_orgs_c.org_id = 'US'
                  THEN
                     --periodically submitting concurrent programs

                     l_boolean :=
                        fnd_submit.set_repeat_options (
                           --repeat_time     => '14:10:00'--to_char(sysdate,'hh24:mi:ss'),
                           repeat_interval   => 15,
                           repeat_unit       => 'MINUTES',
                           repeat_type       => 'END',
                           repeat_end_time   => SYSDATE + 45
                        );
                  ELSIF v_orgs_c.org_id = 'CA'
                  THEN
                     --periodically submitting concurrent programs

                     l_boolean :=
                        fnd_submit.set_repeat_options (
                           --repeat_time     => '14:10:00'--to_char(sysdate,'hh24:mi:ss'),
                           repeat_interval   => 30,
                           repeat_unit       => 'MINUTES',
                           repeat_type       => 'END',
                           repeat_end_time   => SYSDATE + 45
                        );
                  ELSIF v_orgs_c.org_id = 'UK'
                  THEN
                     --periodically submitting concurrent programs

                     l_boolean :=
                        fnd_submit.set_repeat_options (
                           --repeat_time     => '14:10:00'--to_char(sysdate,'hh24:mi:ss'),
                           repeat_interval   => 60,
                           repeat_unit       => 'MINUTES',
                           repeat_type       => 'END',
                           repeat_end_time   => SYSDATE + 45
                        );
                  END IF;



                  --
                  --submitting concurrent request
                  --
                  
                  if v_concurrent_jobs_c.concurrent_program_name  = 'XXPP_HOLD_PROD'  then
                  l_request_id :=
                     fnd_request.submit_request (
                        application   => 'XXPP',
                        program       => v_concurrent_jobs_c.concurrent_program_name,
                        description   => v_concurrent_jobs_c.user_concurrent_program_name,
                        start_time    => SYSDATE,
                        sub_request   => FALSE 
                     );
                  --
                  COMMIT;
                  
                  
                  elsif v_concurrent_jobs_c.concurrent_program_name  = 'XXPP_LOAD_BONUS_SH_ATTR'  then
                  
                    l_request_id :=
                     fnd_request.submit_request (
                        application   => 'XXPP',
                        program       => v_concurrent_jobs_c.concurrent_program_name,
                        description   => v_concurrent_jobs_c.user_concurrent_program_name,
                        start_time    => SYSDATE,
                        sub_request   => FALSE,
                        argument1     => 'Net Change Refresh',
                          argument2     => null
                     );
                  --
                  COMMIT;
                  
                     elsif v_concurrent_jobs_c.concurrent_program_name  = 'XXDAZ_ONT_CONT_ORDER_CREATION'  then
                  
                    l_request_id :=
                     fnd_request.submit_request (
                        application   => 'XXDAZ',
                        program       => v_concurrent_jobs_c.concurrent_program_name,
                        description   => v_concurrent_jobs_c.user_concurrent_program_name,
                        start_time    => SYSDATE,
                        sub_request   => FALSE,
                        argument1     =>  0,
                        argument2     => ' N'
                     );
                  --
                  COMMIT;

                 elsif v_concurrent_jobs_c.concurrent_program_name  = 'XXDAZ_ONT_CONT_ORDERBK_PRC'  then
                  
                    l_request_id :=
                     fnd_request.submit_request (
                        application   => 'XXDAZ',
                        program       => v_concurrent_jobs_c.concurrent_program_name,
                        description   => v_concurrent_jobs_c.user_concurrent_program_name,
                        start_time    => SYSDATE,
                        sub_request   => FALSE,
                        argument1     =>  NULL,
                        argument2     => 'A'
                     );
                  --
                  COMMIT; 
                 
END IF;

                  --
                  IF l_request_id = 0
                  THEN
                     DBMS_OUTPUT.put_line (
                        'Concurrent request failed to submit'
                     );
                  ELSE
                     DBMS_OUTPUT.put_line (
                        'Successfully Submitted the Concurrent Request'
                     );
                  END IF;
               EXCEPTION
                  WHEN OTHERS
                  THEN
                     DBMS_OUTPUT.put_line('Error While Submitting Concurrent Request '
                                          || TO_CHAR (SQLCODE)
                                          || '-'
                                          || SQLERRM);
               END;
          -- END LOOP;
         END IF;
                                                   
      END LOOP;
   END LOOP;
--
PP_OM_BATCH_AUTH;
ELSE
DBMS_OUTPUT.PUT_LINE ( 'Please check the Right Instance = ' || l_instance_name );
END IF;
EXCEPTION
   WHEN OTHERS
   THEN
      DBMS_OUTPUT.put_line(   'Error While Submitting Concurrent Request '
                           || TO_CHAR (SQLCODE)
                           || '-'
                           || SQLERRM);
END;
/