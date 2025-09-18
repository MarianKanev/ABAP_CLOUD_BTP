CLASS z_oop_demo_1 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    CONSTANTS islm_scenario   TYPE aic_islm_scenario_id=>type        VALUE 'ZDEMO_ABAP_INT_SCEN'.
    CONSTANTS prompt_template TYPE aic_islm_prompt_template_id=>type VALUE 'ZDEMO_PROMPT_TEMPLATE'.

    DATA error      TYPE REF TO cx_root.
    DATA ai_api     TYPE REF TO if_aic_completion_api.
    DATA error_text TYPE string.
    DATA llm_result TYPE REF TO if_aic_completion_api_result.
    DATA llm_answer TYPE string.

ENDCLASS.


CLASS z_oop_demo_1 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*&---------------------------------------------------------------------*
*& Creating an instance of the ISLM completion API
*&---------------------------------------------------------------------*

    out->write( |1) Creating an instance of the ISLM completion API\n| ).

    TRY.
        ai_api = cl_aic_islm_compl_api_factory=>get( )->create_instance( islm_scenario ).
      CATCH cx_aic_api_factory INTO error.
        error_text = error->get_text( ).
        out->write( error_text ).
    ENDTRY.

    IF error IS INITIAL.
      out->write( `An instance of the ISLM completion API has been created.` ).
    ELSE.
      RETURN.
    ENDIF.

    out->write( |\n| ).
    out->write( repeat( val = `_`
                        occ = 70 ) ).
    out->write( |\n| ).

*&---------------------------------------------------------------------*
*& Calling the LLM completion API with a prompt as string
*&---------------------------------------------------------------------*

    out->write( |2) Calling the LLM completion API with a prompt as string \n\n| ).

    TRY.
        llm_result = ai_api->execute_for_string( `Tell me a joke.` ).
        llm_answer = llm_result->get_completion( ).
        out->write( data = llm_answer
                    name = `llm_answer` ).
      CATCH cx_aic_completion_api INTO error.
        out->write( error->get_text( ) ).
    ENDTRY.

    out->write( |\n| ).
    out->write( repeat( val = `_`
                        occ = 70 ) ).
    out->write( |\n| ).

*&---------------------------------------------------------------------*
*& Setting parameters
*&---------------------------------------------------------------------*

    out->write( |3) Setting parameters \n\n| ).

    TRY.
        " Creating another instance of the ISLM completion API
        ai_api = cl_aic_islm_compl_api_factory=>get( )->create_instance( islm_scenario ).

        " Setting parameters such as maximum tokens or temperature
        FINAL(params) = ai_api->get_parameter_setter( ).
        params->set_maximum_tokens( 500 ).
        params->set_temperature( '0.5' ). " The value must be between 0 and 1

        llm_result = ai_api->execute_for_string( `What is ABAP?` ).
        llm_answer = llm_result->get_completion( ).
        out->write( data = llm_answer
                    name = `llm_answer` ).
      CATCH cx_aic_api_factory
            cx_aic_completion_api INTO error.
        error_text = error->get_text( ).
        out->write( error_text ).
    ENDTRY.

    out->write( |\n| ).
    out->write( repeat( val = `_`
                        occ = 70 ) ).
    out->write( |\n| ).

*&---------------------------------------------------------------------*
*& Retrieving information regarding the result
*&---------------------------------------------------------------------*

    out->write( |4) Retrieving information regarding the result \n\n| ).

    TRY.
        " Creating another instance of the ISLM completion API
        ai_api = cl_aic_islm_compl_api_factory=>get( )->create_instance( islm_scenario ).
        llm_result = ai_api->execute_for_string( `What is an internal table in ABAP?` ).
        llm_answer = llm_result->get_completion( ).

        " Number of tokens of the LLM output
        FINAL(completion_token_count) = llm_result->get_completion_token_count( ).
        " Number of tokens of the LLM input
        FINAL(prompt_token_count) = llm_result->get_prompt_token_count( ).
        " Number of tokens of the LLM input and output
        FINAL(total_token_count) = llm_result->get_total_token_count( ).
        " Runtime of LLM call in milliseconds
        FINAL(runtime) = llm_result->get_runtime_ms( ).

        out->write( data = llm_answer
                    name = `llm_answer` ).
        out->write( |\n| ).
        out->write( data = completion_token_count
                    name = `completion_token_count` ).
        out->write( data = prompt_token_count
                    name = `prompt_token_count` ).
        out->write( data = total_token_count
                    name = `total_token_count` ).
        out->write( data = runtime
                    name = `runtime` ).

      CATCH cx_aic_api_factory
            cx_aic_completion_api INTO error.
        error_text = error->get_text( ).
        out->write( error_text ).
    ENDTRY.

    out->write( |\n| ).
    out->write( repeat( val = `_`
                        occ = 70 ) ).
    out->write( |\n| ).

*&---------------------------------------------------------------------*
*& Calling the LLM completion API with a prompt as message list
*&---------------------------------------------------------------------*

    out->write( |5) Calling the LLM completion API with a prompt as message list \n\n| ).

    TRY.
        " Creating another instance of the ISLM completion API
        ai_api = cl_aic_islm_compl_api_factory=>get( )->create_instance( islm_scenario ).

        " Creating a message container instance and adding messages
        FINAL(message_container) = ai_api->create_message_container( ).
        message_container->set_system_role( `You are a professional translator` ).
        message_container->add_user_message( `Can you translate German into English?` ).
        message_container->add_assistant_message( `Yes` ).
        message_container->add_user_message(
            `Translate the following German sentence into English: "Entschuldigung, wie komme ich zum Bahnhof?"` ).
        llm_answer = ai_api->execute_for_messages( message_container )->get_completion( ).

        " Retrieving the messages added to the message container
        FINAL(messages) = message_container->get_messages( ).
        out->write( data = llm_answer
                    name = `llm_answer` ).
        out->write( |\n| ).
        out->write( data = messages
                    name = `messages` ).
      CATCH cx_aic_api_factory
            cx_aic_completion_api INTO error.
        error_text = error->get_text( ).
        out->write( error_text ).
    ENDTRY.

    out->write( |\n| ).
    out->write( repeat( val = `_`
                        occ = 70 ) ).
    out->write( |\n| ).

*&---------------------------------------------------------------------*
*& Calling the prompt library API to use prompt templates
*&---------------------------------------------------------------------*

    out->write( |6) Calling the prompt library API to use prompt templates \n\n| ).

    TRY.
        " Creating another instance of the ISLM completion API
        ai_api = cl_aic_islm_compl_api_factory=>get( )->create_instance( islm_scenario ).

        FINAL(prompt_temp) = cl_aic_islm_prompt_tpl_factory=>get( )->create_instance( islm_scenario = islm_scenario
                                                                                      template_id   = prompt_template ).

        " Retrieving the prompt from the template
        " Note that, depending on the prompt template setup, there may be input parameters
        "('parameters' importing parameter) in the following method call to be assigned.
        FINAL(prompt) = prompt_temp->get_prompt( ).
        FINAL(msg_container) = ai_api->create_message_container( ).
        msg_container->set_system_role( prompt ).
        msg_container->add_user_message( `... some user message ...` ).
        llm_answer = ai_api->execute_for_messages( msg_container )->get_completion( ).

        out->write( data = llm_answer
                    name = `llm_answer` ).
      CATCH cx_aic_api_factory
            cx_aic_completion_api
            cx_aic_prompt_template INTO error.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.



