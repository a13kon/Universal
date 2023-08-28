//  Terminal1 code

(*				BEGIN GLOBAL VARIABLE IMPORT CODE				*)

VAR_GLOBAL
    QUICK_MENU_ITEMS_NO      : INT:=7;      // Set here the number of voices for "Quick Menu"
    DTRetMain               : INT;   // Support variable for Main Mask return 
    DTQM                    : INT;   // Support variable for quick menu icon blink
    IncrTmp                 : INT ;  // Support variable for password management
    PwdIn                   : UINT;  // Input password
    PwdRes                  : INT ;  // Password result
    EnLogOut                : BOOL;  // Enable for Logout mask
    EnPwdChgU               : BOOL;  // Enable for User password change
    EnPwdChgS               : BOOL;  // Enable for Service password change
    EnPwdChgM               : BOOL;  // Enable for Manufacturer password change
    PwdTyp                  : INT ;  // Password type in login menu(1: User; 2: Service; 3: Manufacturer)
    PwdTypMenu              : INT ;  // Copy of PwdType that shows in the menu the user access
    // PwdManuf          : BOOL; // флаг заводского допуска
    //PwdDev                  : BOOL; // флаг допуска разработчика
    CntDwnPwdTypMenu        : INT ; // Countdown in second to show the user access in the menu (-1 to always on)
    IdxImgQM                : INT:=1;// Icon position management of Quick Menu
    IdxQM                   : INT:=1;// Index of quick menu
//    MaskPos                 : USINT ; // Position of the current Mask
    ImpExpSel               : BOOL; // Import/Export selection
    EnImpExpTmp             : INT ; // Temporary enable of Import/Export parameters functions
    LangTime                : INT ; // Language mask time
    LogoTime                : INT ; // Logo mask time
    EnLangChg               : BOOL; // Language countdown enable
    Date1, Date2, Date3     : UINT; // Mask date management    
    EnStartup               : BOOL; // Enable application startup 
    enEndDef                : BOOL; // Enable EndDefault mask
    enConfigMask            : BOOL; // Enable Config mask
    enLogo                  : BOOL; // Enable Logo mask   
    BoardTempMsk            : REAL; // Internal board temperature 
    EnAlrmExpTmp            : INT;  // Temporary enable of Export alarms functions
    En_WipeRetain           : BOOL; // Enable wipe retain memory
    En_WipeNVRAM            : BOOL; // Enable wipe NVRAM memory
    En_WipeAll              : BOOL; // Enable wipe retain+NVRAM memory
    TimeZoneTmp             : UINT; // Temp variable for time zone mng
    TimeZoneTmpRu           : UINT; // Подмена TimeZoneTmp. Для списка городов РФ.
    SetTimeZoneTmp          : INT;  // Temp variable for time zone mng
    FirstCycleDone          : BOOL; // UoM initialization
    LastValidRecord                                 : DINT;  // Index of the last valid record
    LastActAlrm                                     : DINT;  // Index of the last active alarm
    infoLogOk, AlrmLogInfoErr                       : DINT;  // result of function GetAlarmLogInfo
	AlrmIdx, AlrmCode                               : DINT;  // Used on GetAlarmInfo
    AlrmLogsIdx, AlrmLogCode, AlrmLogsTot           : DINT;  // Used on GetAlarmLogInfo
    AlrmLogEventType                                : USINT; // Type of alarm event
    AlrmStoredVarReal1, AlrmStoredVarReal2          : REAL;  // Alarm variable stored  
    EnStoredVar1_REAL, EnStoredVar2_REAL            : BOOL;  // Stored alarm variable enable
    N_Alrms,N_Alrms_Prev                            : DINT;  // Current and previous alarm number
    KeyAlarmAutorepeatActive                        : BOOL;  // Single alarm reset management
    ClrAutoResCounters                              : BOOL;  // Enable for ClrAutoResCounters statement
    AlrmLogsIdxTemp,AlrmLogCodeTemp,AlrmLogTimeTemp : DINT;  // Temporary variables for alarm information
    AlrmLogEventTypeTemp                            : USINT; // Temporary variables for "AlrmLogInfoErr" statement
    AlrmLogDelete                                   : BOOL;  // Alarm log delete enable 
    EnCheckAlarm                                    : BOOL;  // Enable check alarm function 
    En_CheckAlrm_Reset                              : BOOL;  // Enable the alarm check after a Global alarm Reset
    ShowTemp                                        : BOOL;  // Show Board temperature if the function is implemented on the target (only c.pCO)
    isActiveAlarmLoop                               : BOOL;  // Флаг, находимся ли мы в списке активных аварий
    isNoAlarmMask                                   : BOOL;  // Флаг, находимся ли мы в маске Нет аварий
    isPasswordRequest                               : BOOL;  // Флаг, запрос пароля            
    IdxMskTmp1, BarPosTmp1, CurrItemNoTmp1          : INT; // Temporary variables for first Level menu(save the last position of the first Level menu)
    IdxImg1Tmp1, IdxImg2Tmp1, IdxImg3Tmp1           : INT; // Temporary variables for first Level menu(save the last position of the first Level menu)
    IdxMskTmp2, BarPosTmp2, CurrItemNoTmp2          : INT; // Temporary variables for second Level menu(save the last position of the second Level menu)
    IdxImg1Tmp2, IdxImg2Tmp2, IdxImg3Tmp2           : INT; // Temporary variables for second Level menu(save the last position of the second Level menu)
    CurPosition                                     : USINT; // текущая позиция курсора
    NextRow, NextColumn                             : USINT; // следующая позиция курсора
    CurShow                                         : ARRAY [1..30] OF BOOL; // булевы переменные для демонстрации позиции курсора
    ModePRG                                         : BOOL; // StatePRG = STATE_PRG_ON
    popup_StatePRG                                  : USINT; // сохраненное значение StatePRG
    NotModePRG                                      : BOOL; // инвертированый ModePRG
    DTPopUp                                         : USINT; // таймер для всплывающих сообщений
    En_PopUpTimer                                   : BOOL; // запуск обратного отсчета для всплывающих окон
//     En_DTPopUp                                      : BOOL; // разрешение на обратный отсчет всплывающего окна 
    Show_DTPopUp                                    : BOOL; // разрешение на отображение обратного отсчета всплывающего окна
    PopUpKeyDelay                                   : USINT; // задержка определения нажатия клавиши для всплывающих окон
    ReturnToPrevMask                                : BOOL; // Флаг возвращения с всплывающей маски на предыдущую маску, а не Restore
    PIC_Fan                                         : INT;  // переменная состояний вентилятора на гл.экране
    PIC_RoleSlave                                   : BOOL; // когда роль - ведомый. Отображение состояний в группе/индивидуальный
    GotoMaskModeSeqOnNextCycle                      : BOOL; // переходит в маску ModeSeq на следующий цикл
    Num_ResetComp                                   :  INT; // номер компрессора для сброса статистики 
    //FirstConfig                                     : BOOL; // 090718 первая конфигурация установки после сброса wipe retain
    //modelLineInit                                   : BOOL; // Флаг инициализации модельного ряда
    temp_Role                                       : USINT;// Временная переменная для определения роли устройства
    //temp_UnitModel                                  : USINT;// Временная переменная для определения модели устройства
    temp_Config_Reset                               : BOOL; // Временная переменная для сброса конфигурации
    temp_HeatType                                   : USINT;// Временная переменная для HeatType
    temp_En_Schedule                                : BOOL; // Временная переменная для En_Schedule
    Temp_MB_port                                    : USINT;// Временная переменная для MB_port(0-не задан, 1-Ethernet, 2-BMS card, 3-BMS2)
    En_MB_Ethernet                                  : BOOL; // Флаг выбранного порта: ethernet 
    En_MB_BMS_Card                                  : BOOL; // Флаг выбранного порта: BMS_Card 
    En_MB_BMS2                                      : BOOL; // Флаг выбранного порта: BMS2 
    En_MB_BMS                                       : BOOL; // Выбран BMS_Card или BMS2
    Temp_MB_Address                                 : USINT;// Временная переменная для MB_Address
    Temp_MB_Baudrate                                : UDINT;// Временная переменная для Baudrate
    Temp_MB_StopBits                                : USINT;// Временная переменная для Stopbits
    Temp_MB_Parity                                  : USINT;// Временная переменная для Parity
    Reboot_Reason                                   : USINT;// Причина перезагрузки (1-сброс конфигурации, 2-изменение типа электронагрева, 3-изменение роли устройства, 4-изменение настроек ModBus)
    old_FWMismatch                                  : BOOL; // Предыдущее значение FWMismatch 
    temp_Wait                                       : BOOL; // заглушка на 1 цикл
    checkZeroColumn                                 : BOOL; // проверка курсора на 0 столбец
//    temp_CurDLE                                     : USINT;// временная CurDLE
    langWasChanged                                  : BOOL; // Флаг применения языка при загрузке
    goToConfig                                      : BOOL; // Флаг перехода к конфигурации     
    upArrow                                         : BOOL; // отображение стрелки ВВЕРХ  
    downArrow                                       : BOOL; // отображение стрелки ВНИЗ
    autoHideArrowsOff                               : BOOL; // отключение автосброса отображения стрелок
    //NextCycleAction                                 : USINT;// действие на следующий цикл

    PopUp_Message                                   : USINT;// номер сообщения для всплывающего окна    
    PopUp_Question                                  : USINT;// номер вопроса для всплывающего окна    
    SetIdxMskTmp, SetBarPosTmp, SetCurrItemNoTmp    : INT; // Temporary variables for Settings menu(save the last position of the settings menu)
    SetIdxImg1Tmp, SetIdxImg2Tmp, SetIdxImg3Tmp     : INT; // Temporary variables for Settings menu(save the last position of the settings menu)
    Show_DevRole                                    : BOOL; // Разрешение отображения роли устройства на Main
    goto_RestoreParam                               : BOOL; // флаг перехода на маску Restore_Param

// Слайдер
    //Slider_1                                        : USINT; // отображение ползунка
    //Slider_2                                        : USINT; // отображение ползунка
    //Slider_3                                        : USINT; // отображение ползунка
    //Slider_4                                        : USINT; // отображение ползунка
    //Slider_5                                        : USINT; // отображение ползунка
    //Slider_6                                        : USINT; // отображение ползунка
    //Slider_Height                                   : USINT; // высота ползунка

// Константы
    POPUP_TIME                                      : USINT:=5; // время для всплывающих окон   
    SHORT_POPUP_TIME                                : USINT:=1; // время для коротких всплывающих окон 
    STATE_PRG_OFF                                   : USINT:=0; // режим редактирования НЕ активен 
    STATE_PRG_READY                                 : USINT:=1; // режим редактирования возможен, но выключен
    STATE_PRG_ALWAYS_ON                             : USINT:=2; // режим редактирования активен и требуется GotoCursor 
    STATE_PRG_ON                                    : USINT:=3; // режим редактирования активен с возвратом на 1 через PRG
    //MASK_POS_MAIN                                   : USINT:=1;  // позиция маски главного экрана в дереве меню
    //MASK_POS_MENU                                   : USINT:=2;  // позиция маски главного меню  в дереве меню
    //MASK_POS_MAINMENU                               : USINT:=3;  // позиция маски главного меню (с сохранением позиции) в дереве меню
    //MASK_POS_SETTINGS                               : USINT:=4;  // позиция маски настроек в дереве меню
    //MASK_POS_VENTILATION                            : USINT:=5;  // позиция маски вентиляции в дереве меню
    //MASK_POS_GROUP                                  : USINT:=6;  // позиция маски группового управления в дереве меню
    //MASK_POS_SERVICE                                : USINT:=7;  // позиция маски сервис в дереве меню
    //MASK_POS_FRIDGE                                 : USINT:=8;  // позиция маски холод.машины в дереве меню
    //MASK_POS_MCLIMATE                               : USINT:=9;  // позиция маски микроклимата в дереве меню
    //MASK_POS_IOMANAGE                               : USINT:=10; // позиция маски входов-выходов в дереве меню
    //MASK_POS_CONFIGURATOR                           : USINT:=11; // позиция маски конфигурации в дереве меню
    //MASK_POS_SCHEDULE                               : USINT:=12; // позиция маски расписания в дереве меню

// Для маски пароля
    hide_PassDigit1                                 : BOOL; // скрывает за звездочкой 1-й символ пароля
    hide_PassDigit2                                 : BOOL; // скрывает за звездочкой 2-й символ пароля
    hide_PassDigit3                                 : BOOL; // скрывает за звездочкой 3-й символ пароля
// Навигация
    //CurRow                                          : USINT;  Курсор текущей строки
    //CurRow_modePRG                                  : DINT; // Курсор текущей строки в режиме редактирования
    CurColumn                                       : USINT; // Текущий столбец
    //CurDescription                                  : USINT; // Текущее описание
    //CurList_Position                                : DINT:= 1; // Текущая позиция в списке
    ConfigStartLevel                                  : USINT; // Уровень с которого начинается конфигуратор
    //Display.Path.MenuPoint                                  : ARRAY [0..10] OF USINT; // сохранённый пункт меню
    //Display.Path.Position                                   : ARRAY [0..10] OF DINT; // сохранённая позиция меню
    //Display.Path.Row                                     : ARRAY [0..10] OF DINT; // сохранённая позиция меню
    //isConfigMenu                                    : BOOL; // Флаг, нахождение в меню конфигурации
    Cmd_ResetAlarms                                 : BOOL;

//OnOff
    RC_OnOff                                        : BOOL;  
    BMS_OnOff                                       : BOOL;
    Schedule_OnOff                                  : BOOL;
    STATE_OnOff                                     : BOOL;
//Маски
    DF_MID_MAIN:  USINT:= 1;    //Гл.экран
    DF_MID_LOGIN:  USINT:= 2;    //Логин
    DF_MID_MMENU:  UINT:= 3;    //Осн.меню
    DF_MID_ONOFF:  USINT:= 4;    //Управление
    DF_MID_LOAD:  USINT:= 5;    //Маска загрузки
    DF_MID_ETH:  USINT:= 6;    //Настройки Ethernet
    DF_MID_SCH_MG:  USINT:= 7;    //Управление расписанием
    DF_MID_ALOG:  USINT:= 8;    //Журнал аварий
    DF_MID_SEQ:  USINT:= 9;    //Последовательности
    DF_MID_CFG_M:  USINT:= 10;    //Мастер конфигурации
    DF_MID_IO_DI:  USINT:= 11;    //Дискретные входы
    DF_MID_IO_AI:  USINT:= 12;    //Аналоговые входы
    DF_MID_IO_DO:  USINT:= 13;    //Дискретные выходы
    DF_MID_IO_AO:  USINT:= 14;    //Аналоговые выходы
    DF_MID_SET:  USINT:= 15;    //Уставка
    DF_MID_OUT:  USINT:= 16;    //Выход
    DF_MID_GROLE:  USINT:= 17;    //Роль устройства
    DF_MID_GSET:  USINT:= 18;    //Настройки группы
    DF_MID_GSTCT:  USINT:= 19;    //Состав группы
    DF_MID_PAR:  USINT:= 20;    //Маска параметров
    DF_MID_CM_STA:  USINT:= 21;    //ХМ: Статистика
    DF_MID_DTIME:  USINT:= 22;    //Дата и время
    DF_MID_LANG:  USINT:= 23;    //Язык
    DF_MID_PASS:  USINT:= 24;    //Управление доступом
    DF_MID_SCORR:  USINT:= 25;    //Коррекция датчиков
    DF_MID_MODBUS:  USINT:= 26;    //Настройки ModBus
    DF_MID_UPGR:  USINT:= 27;    //Обновление
    DF_MID_SCH:  USINT:= 28;    //Расписание
    DF_MID_CMOD:  USINT:= 29;    //Режим управления
    DF_MID_MSG:  USINT:= 30;    //Маска сообщения
    DF_MID_QSTN:  USINT:= 31;    //Маска вопроса
    DF_MID_SLST:  USINT:= 32;    //Маска ведомых
    DF_MID_ROLE:  USINT:= 33;    //Роль устройства
    DF_MID_BMS:  USINT:= 34;    //Настройки BMS
    DF_MID_PARMNG:  USINT:= 35;    //Загрузка/Сохранение на USB
    DF_MID_CFG_DI:  USINT:= 36;    //Дискретные входы (конфиг)
    DF_MID_CFG_AI:  USINT:= 37;    //Аналоговые входы (конфиг)
    DF_MID_CFG_DO:  USINT:= 38;    //Дискретные выходы (конфиг)
    DF_MID_CFG_AO:  USINT:= 39;    //Аналоговые выходы (конфиг)
    DF_MID_COLM:  USINT:= 40;    //Холодильная машина
    DF_MID_NETM:  USINT:= 41;    //Карта сети
    DF_MID_INFO:  USINT:= 42;    //Информация
    DF_MID_PSET:  USINT:= 43;    //Наборы уставок
    DF_MID_HUMID:  USINT:= 44;    //Пароувлажнитель
    DF_MID_RESSET:  USINT:= 45;    //Настройки соединения

END_VAR

(*				END GLOBAL VARIABLE IMPORT CODE					*)

(*				BEGIN IMPORT CODE				*)

FUNCTION TIMED_LOOP 
 
    ButtonsSupport();
    PopUpSupport();
    ArrowSupport();
    NextCycleAction();
    ShowMessage();
    ShowQuestion();
    LoadMask();
    MyLoopFunction();       // моя функция для исполнения процедур в основном цикле
    //  ---Timed Loop Functions--- //     
    IF NOT(BootEnd) THEN 
        Boot();              // исполнять только при загрузке
    ELSIF  NOT (GeneralMng.VerMismatch) THEN        
        CheckAlarm();      
        BlinkQuickMenu();       // мигает быстрое меню
        RetMainMsk();           // возврат на главный экран по истечении таймера. НЕ ЗАПУСКАТЬ ДО КОНФИГУРАЦИИ!
        // MskDateFormat();      // изменение формата даты. нигде не используется.      
        UsrAccessMenu();
        CheckAlrm_Reset();       
    END_IF;

    //  --- Leds and Delays management--- // 
    SetExternalDisplayMode(1,240); // Set the backlight timer after 4 minutes of inactivity for external display
    SetBuiltInDisplayMode(2,240); // Set the backlight timer after 4 minutes of inactivity for internal display
    BoardTempMsk:= GeneralMng.BoardTemp_Msk; // Board Temperature in °C
    IF GeneralMng.BoardTyp[1] = 12 THEN
        ShowTemp:= TRUE;
    ELSIF GeneralMng.BoardTyp[1] <> 12 THEN
        ShowTemp:= FALSE;
    END_IF;
    //  UoM management - startup initialization
    IF FirstCycleDone = FALSE THEN
        FirstCycleDone := TRUE;
        SetUoMZone (STD_UOM_ZONE_UI);
    END_IF;

    

END_FUNCTION


FUNCTION Boot   
    //Показываем маску выбора языка только при отсутствии файла конфигурации
    IF (firstConfig) THEN  
        IF (GeneralMng.ID_Lang = -1) THEN     // If ID_Language = -1, it means that a Wipe Retain has just be done              
            GeneralMng.ID_Lang:= 0;
            LangTime:= 30;
            EnLangChg:= TRUE;
            GotoMask(Language);
            StatePRG:= STATE_PRG_ALWAYS_ON;
        END_IF;
        IF (EnLangChg) THEN 
            ShowLangMskTime();
        ELSE 
            IF NOT(enConfigMask) THEN
                enConfigMask:= TRUE;
                ModePRG:= TRUE;
                StatePRG:= STATE_PRG_ALWAYS_ON;
                SetLedStatus(7, 0);
                isConfigMenu:= TRUE; //здесь нужно что бы данные успели подгрузиться до вызова маски
                LoadMaskID(10, 1); //REF_CONFIGURATOR;
            END_IF;
        END_IF;
    ELSE
        // отображение маски EndDefault после стирания retain
        IF (RetainIsClear) THEN 
            IF NOT(enEndDef) THEN // выполняем 1 раз
                enEndDef:= TRUE;        
                SetLedStatus(7,2);
                Gotomask(EndDefault);
            END_IF;
        ELSIF (enLogo = FALSE) THEN                                            
            enLogo := TRUE;
            SetLedStatus(7,0);        
            Gotomask(LogoMask);
            LogoTime:= 5;  
        ELSIF (LogoTime > 0) THEN    
            LogoTime:= LogoTime - 1;
        ELSIF (GeneralMng.ID_Lang = -1) THEN     // 141019 Защита, если ID_Lang не инициализировалась 
            GeneralMng.ID_Lang:= 0;
            ChangeLanguage(GeneralMng.ID_Lang);
        ELSE
            BootEnd:=       TRUE; 
            StartupJmp:=    FALSE; //071019
            GotoMain();
        END_IF;

        //// Определение линейки моделей
        //IF (ModelLine = 0)OR(modelLineInit)OR(firstConfig) THEN          // зацикливание, если попали в конфигуратор
            //IF NOT(temp_Wait) THEN// заглушка на 1 с, т.к. ModelLine не обновляется сразу
                //temp_Wait:= TRUE;
            //ELSIF NOT (modelLineInit) AND NOT(GeneralMng.Reset_Params) THEN     // Init
                //modelLineInit:= TRUE;
                //ModePRG:=       TRUE;
                //StatePRG:=      STATE_PRG_ALWAYS_ON;
                //LoadMaskID(10, 0); //REF_CONFIGURATOR;
                //SetLedStatus(7,0);
            //END_IF; 
        //// отображение маски EndDefault после стирания retain
        //IF (GeneralMng.EndDefMsk) THEN 
            //IF NOT(enEndDef) THEN // выполняем 1 раз
                //enEndDef:= TRUE;        
                //SetLedStatus(7,2);
                //Gotomask(EndDefault);
            //END_IF;
        //ELSIF (enLogo = FALSE)AND(enEndDef) THEN                                     
            //enLogo := TRUE;
            //SetLedStatus(7,0);        
            //Gotomask(LogoMask); 
        //ELSIF NOT(StartupJmp) THEN
            //BootEnd:= TRUE; 
            //GotoMain();
        //END_IF;



    //IF GeneralMng.ID_Lang = -1 THEN     // If ID_Language = -1, it means that a Wipe Retain has just be done     
        //GeneralMng.ID_Lang:= 0;
        //LangTime:=      30;
        //EnLangChg:=     TRUE;
        //GotoMask(Language);
        //StatePRG:= STATE_PRG_ALWAYS_ON;
    //END_IF;
           
        //// Назначение переменных в зависимости от модельного ряда
        //IF NOT(uiTurnOn)AND(ModelLine > 0) THEN
            //CASE ModelLine OF
                //2: // DLE
                    //MAIN_MENU_ITEMS_NO:=        5;
                    //VENT_MENU_ITEMS_NO:=        6;
                    //SETTINGS_MENU_ITEMS_NO:=    4;
                    //SERVICE_MENU_ITEMS_NO:=     8;
                    //IF (Role_Master) THEN
		                //GROUP_MENU_ITEMS_NO:=   3;
                    //ELSE
                        //GROUP_MENU_ITEMS_NO:=   2;
                    //END_IF;
                    //SCHEDULE_MENU_ITEMS_NO:=    1;
                    //CONFIGURATOR_DLE_MENU_ITEMS_NO:= 4;
//
                //3: // POOL
                    //MAIN_MENU_ITEMS_NO:=        6;
                    //VENT_MENU_ITEMS_NO:=        3;
                    //SETTINGS_MENU_ITEMS_NO:=    3;
                    //SERVICE_MENU_ITEMS_NO:=     8;
                    //SCHEDULE_MENU_ITEMS_NO:=    2;
                    //CONFIGURATOR_POOL_MENU_ITEMS_NO:= 3;
            //
            //END_CASE;
            //uiTurnOn:=    TRUE;
       //END_IF;
    END_IF;
END_FUNCTION
//
//
//FUNCTION ModelLine_Confirm
//
    ////Compare();     
    ////GotoMask(Reboot);   
    //ModelLine:= temp_ModelLine; // 100419 
    //
//END_FUNCTION

FUNCTION ArrowSupport
    // отображение стрелок
    IF NOT(autoHideArrowsOff) THEN
        IF (upArrow) THEN
            upArrow:= FALSE;
        END_IF;
        IF (downArrow) THEN
            downArrow:= FALSE;
        END_IF;
    END_IF;
END_FUNCTION

FUNCTION ButtonsSupport
    // управление подсветкой кнопки PRG
    IF (StatePRG = STATE_PRG_READY) THEN 
        SetLedStatus(7,2); // моргает
    ELSIF (StatePRG = STATE_PRG_ALWAYS_ON)OR(StatePRG = STATE_PRG_ON) THEN 
        SetLedStatus(7,1); // горит
    ELSE 
        SetLedStatus(7,0); // не горит
    END_IF;
    
    IF (StatePRG = STATE_PRG_ALWAYS_ON)OR(StatePRG = STATE_PRG_ON) THEN  (*!!! 090718 провверить не ломает ли где StatePRG = STATE_PRG_ALWAYS_ON логику!*)
        ModePRG:= TRUE;
    ELSE 
        ModePRG:= FALSE;
    END_IF;
    NotModePRG:= NOT(ModePRG);
END_FUNCTION

FUNCTION NextCycleAction   // Выполнение действий с задержкой на 1 цикл    
    IF (NextCycleAction <> 0) THEN        
        CASE NextCycleAction OF
            1: // Восстановление сохраненной маски
                RestoreMask();

            2: // обновление маски с выкидыванием курсора за пределы экрана
                RestoreMask();
                GotoCursor(0,10);

            //3: // переход на следующую маску (в петле First_Config)
                //Move_Down();
                //GotoCursor(0,10);
                //MakeChoice:= FALSE;

            4: // переход к петле UPGRADE в следующем цикле
                GotoLoop (UPGRADE);

            //5: // Обновить данные Ethernet
                //read_EthernetSettings:= TRUE;

            //6:  // переход к петле CONFIRM_CONFIG в следующем цикле
                //StatePRG:= STATE_PRG_READY;
                //GotoLoop(CONFIRM_CONFIG);
                //MakeChoice:=     FALSE;

            //7:  // вызов конфигурации  
                //CASE ModelLine OF
                    //2: // DLE
                        //ModePRG:=           TRUE;
                        //NotModePRG:=        FALSE;
                        //StatePRG:= STATE_PRG_ALWAYS_ON; 
                        //temp_SEQ_Order[1]:= SEQ_Order[1];
                        //temp_SEQ_Order[2]:= SEQ_Order[2];
                        //temp_SEQ_Order[3]:= SEQ_Order[3];
                        //temp_SEQ_Order[4]:= SEQ_Order[4];
                        //temp_SEQ_Order[5]:= SEQ_Order[5];
                        //temp_SEQ_Order[6]:= SEQ_Order[6];
                        //temp_Role:=         Role;
                        //temp_CurDLE:=       CurDLE;
                        //temp_ModeSEQ:=      ModeSEQ;
                        //GotoLoop(FIRST_CONFIG);   
                        //GotoCursor(0,10);  
      //
                    //3: // POOL
                        //IF (is_TOP) THEN
                            //StatePRG:= STATE_PRG_OFF;
                            //CompletePreConfig:= TRUE;
                        //ELSE
                            //temp_UnitModel:=    UnitModel;
                            //temp_SummerMode:=   Par_Dp10;
                            //temp_HeatType:=     HeatType;
                            //NotModePRG:=        TRUE;
                            //ModePRG:=           FALSE;
                            //StatePRG:= STATE_PRG_ALWAYS_ON;
                            //GotoLoop(FIRST_CONFIG);
                            //GotoCursor(0,10);               
                        //END_IF;
//
                                        //
                //END_CASE; 
                //MakeChoice:=     FALSE;

            //8: // Сообщение. Извлеките USB-накопитель!
                //ShowPopUpMessage(23, SHORT_POPUP_TIME);

            9: // Запрос более высокого уровня доступа
                ShowPopUpQuestion(13); 

            10: // Теперь аварии можно сбросить!
                ShowPopUpMessage(14, SHORT_POPUP_TIME);              

            11: 
                //100619 модель поведения стала другой ManualManager(FALSE);
                IF (ManualManage) THEN
                    MaskMng.reset_ManualMode:= TRUE;
                    MaskMng.reset_ManualMode_Outputs:= TRUE;
                    ShowPopUpMessage(16, SHORT_POPUP_TIME); // Ручной режим выключен
                END_IF;

            12: //Обновление текущей позиции
                //CheckListBorders();
                UpdateCurPos();
            13:
                GotoMask(REF_Parameters);
                Display.MaskID:= 20;

            14: //DF_MID_CFG_DI
                GotoMaskID(36, 0); 

            15: //DF_MID_CFG_AI
                GotoMaskID(37, 0); 

            16: //DF_MID_CFG_DO
                GotoMaskID(38, 0);

            17: //DF_MID_CFG_AO
                GotoMaskID(39, 0);

            //18:
                ////GotoMain(); 100419
                //ModelLine_Confirm();

            18: // переход на маску сохранения конфигурации без выхода
                GotoMaskID(5, 3); // DF_MID_LOAD
//
            //19: // переход на маску сохранения конфигурации
                //GotoMask(SaveConfig_Mask);

            19: // переход на маску сохранения конфигурации с выходом
                LoadMaskID(5, 4); // DF_MID_LOAD

            //20: //сброс конфигурации
                //ShowPopUpQuestion(14); 

            20: // переход на маску сохранения конфигурации с выходом в гл.меню
                LoadMaskID(5, 0); //маска загрузки DF_MID_LOAD

            //21: //изменение типа контроллера
                //ShowPopUpQuestion(15); 

            //22: //ошибка конфигурации
                //ShowPopUpMessage(18); 
       
            22: //Выход из конфигуратора
                CurLevel:= ConfigStartLevel;
               IsConfigChanged:= FALSE;
                GlobalEsc();

            23: //переход на маску загрузки конфигурации с вопросом
                ShowPopUpQuestion(16);                 

            24: //возврат на маску конфигурации 
                LoadMaskID(10, 1); //REF_CONFIGURATOR
       
            25: //
                GlobalEsc();

            //26: //не удалось загрузить конфигурацию!
                //ShowPopUpMessage(19, SHORT_POPUP_TIME);  

            27: //
                PopUp_ESC();

            //28: //Загрузка конфигурации с контроллера
                ////Load_Config();
                //load_Config:= TRUE;
                //ConfigMng.loadMask_Esc:= 1; //возврат в корень конфигуратора
                //GotoMask(LoadConfig_Mask);  

            //29: //Загрузка конфигурации с флешки
                //ShowPopUpQuestion(17);

            30: //Вх/вых не сконфигурированы
                ShowPopUpMessage(20, SHORT_POPUP_TIME, TRUE);

            //31: //сброс привязок вх/вых в конфигурации
                //ShowPopUpQuestion(19);
//
            //32: //слова Critical не заполнены!
                //ShowPopUpMessage(21, SHORT_POPUP_TIME);

            //33: //Ошибка конфигурации. Не заполненым пункты меню!
                //ShowPopUpMessage(22, SHORT_POPUP_TIME); 
//
            //34: //не удалось загрузить конфигурацию! (с возвратом к предыдущему уровню)
                //ShowPopUpMessage(19, SHORT_POPUP_TIME, TRUE);

        END_CASE;
        NextCycleAction:= 0;
    END_IF;
END_FUNCTION

FUNCTION ShowMessage
    IF (Show_Message.Num <> 0) THEN
        ShowPopUpMessage(Show_Message.Num, Show_Message.Time, Show_Message.Esc);
        Show_Message.LastNum:=  Show_Message.Num;
        Show_Message.Num:= 0;
        Show_Message.Time:= 0;
        Show_Message.Esc:= FALSE;
    END_IF;
END_FUNCTION

FUNCTION ShowQuestion
    IF (Show_Question.Num <> 0) THEN
        ShowPopUpQuestion(Show_Question.Num, Show_Question.Esc);
        Show_Question.LastNum:=  Show_Question.Num;
        Show_Question.Num:= 0;
        Show_Question.Esc:= FALSE;
    END_IF;
END_FUNCTION

FUNCTION setParamMask  // устанавливает начальное состояние маски параметров
    VAR_INPUT
        maskNum : USINT;
    END_VAR

    CurParam:=          maskNum; 
    getParamMenu:=      TRUE;
    CurRow:=            1;
    CurRow_modePRG:=    0;
    //NextCycleAction:=   12; // Проверяем границы списка
    cnt_Items:= 0;
    
    NextCycleAction:=   13;//GotoMask(REF_Parameters);
END_FUNCTION


FUNCTION MyLoopFunction 
    //Переход на маску Перезагрузка... 
    IF (En_Reboot) THEN
        GotoMask(Reboot);
    END_IF;
    // если при переходе на маску курсор оказывется в 0 столбце - значит маске не нужен курсор. убираем.
    // !!! может сделать определение для всех случаев и проверять при каждом переходе?
    // 23.01.19 Нужен ли? Скорее всего нет.
    IF (checkZeroColumn) THEN
        checkZeroColumn:= FALSE;
        StoreMask();
        IF (__SYSVA_CURSOR_COLUMN = 0)AND(__SYSVA_CURSOR_ROW <> 10)THEN       
            GotoCursor(0,10);
        END_IF;
    END_IF;

    // Управление маской NeedToUpgrade
    IF (FWMismatch) THEN
        IF NOT(old_FWMismatch) THEN
            old_FWMismatch:= FWMismatch;
            //GotoLoop(MAIN);
            GotoMask(Main_Mask);
            SetLedStatus(7,2);
            SetLedStatus(12,0);
            StatePRG:= STATE_PRG_READY;
        END_IF;
    ELSE
        IF (old_FWMismatch) THEN
            old_FWMismatch:= FWMismatch;
            //GotoLoop(MAIN);
            GotoMask(Main_Mask);
            SetLedStatus(7,0);
            StatePRG:= STATE_PRG_OFF;
        END_IF;        
    END_IF;

    // Управление надписью состояния ведомого на главном экране
    PIC_RoleSlave:= NOT(Role_Master);

    // Ручное управление
    IF (ManualManage) THEN
        // 020718 Запрет на нахождение в меню управления выходами при включенной установке
        IF (UnitOn)THEN
            NextCycleAction:= 11; //ManualManager(FALSE);
        END_IF; 
    END_IF;
  

    // Управление пиктограммой вентилятора на главном экране
    IF (is_TOP)AND(NoConnect) THEN 
        PIC_Fan:= 0;
    ELSE
        IF (EQ_Fans.Supply.DO)OR(EQ_Fans.Exhaust.DO) THEN 
            IF (PIC_Fan = 1) THEN 
                PIC_Fan:= 2;
            ELSE 
                PIC_Fan:= 1;
            END_IF;
        ELSIF (FLR_FanSupplyTK.Active)OR(FLR_FanExhTK.Active) THEN 
            PIC_Fan:= 3;
        ELSE 
            PIC_Fan:= 0;
        END_IF;
    END_IF;

    // зажигаем колокольчик, при отображении аварии текущего ведомого или потере связи
    IF (CurSlaveShow) THEN
        IF (CurState = 5)OR(CurState = 2) THEN 
            SetLedStatus(12,1); 
        ELSE 
            SetLedStatus(12,0);
        END_IF;
	END_IF;

 (*Глушим пищалку. установкой RESERVED3 := FALSE*)

    // Переход на маску НЕТ АВАРИЙ при нахождении в авариях текущего ведомого (управление из стратегии)
    IF (MaskMng.SlaveNoAlarms) THEN
        GotoMask(Slave_NoAlrms);        
		MaskMng.SlaveNoAlarms:=FALSE;
    END_IF;  

END_FUNCTION

// УПРАВЛЕНИЕ ВСПЛЫВАЮЩИМИ МАСКАМИ --------------------------------------------------------------------// 
FUNCTION PopUpSupport
    // управление всплывающими окнами      
    IF (En_PopUpTimer) THEN
        IF (DTPopUp <= 0) THEN
            PopUp_ESC();            
        ELSE
            DTPopUp := DTPopUp - 1;     // таймер для всплывающих сообщений. Стремится к 0
            PopUpKeyDelay:= PopUpKeyDelay + 1; // таймер задержки обнаружения нажатия клавиши для сброса таймера
            IF (__SYSVA_KEY_PRESSED = 1) THEN
                IF(PopUpKeyDelay > 1) THEN
                    En_PopUpTimer:=         FALSE;
                ELSE
                    __SYSVA_KEY_PRESSED:=   0;
                END_IF;
            END_IF;
            IF (DTPopUp = 0) THEN
                Show_DTPopUp:=  FALSE;
            END_IF;
        END_IF;
    ELSE
        PopUpKeyDelay:= 0;
        DTPopUp:=       0;
        Show_DTPopUp:=  FALSE;
    END_IF;
END_FUNCTION

FUNCTION ShowPopUpMessage
    VAR_INPUT
        iMessage : USINT; 
    END_VAR
    popup_StatePRG:=    StatePRG;
    StatePRG:= STATE_PRG_OFF;
    StoreMask();
    SaveMenuPos();      //  сохраняем позицию
    DTPopUp:=           0;// без таймера всплывающего окна
    PopUp_Message:=     iMessage;
    Show_DTPopUp:=      FALSE;
    En_PopUpTimer:=     FALSE;
    Gotomask(PopUp_Message_Mask);
END_FUNCTION

FUNCTION ShowPopUpMessage // @Override с заданием времени отображения
    VAR_INPUT
        iMessage : USINT;    
        iTime    : USINT;   
    END_VAR
    popup_StatePRG:=    StatePRG;
    StatePRG:=          STATE_PRG_OFF;
    StoreMask();
    SaveMenuPos();      //  сохраняем позицию
    DTPopUp:=           iTime;// запускаем таймер всплывающего окна
    PopUp_Message:=     iMessage;
    Show_DTPopUp:=      TRUE;
    En_PopUpTimer:=     TRUE;
    Gotomask(PopUp_Message_Mask);
    //LoadMaskID(30, 0);//DF_MID_MSG
END_FUNCTION

FUNCTION ShowPopUpMessage // @Override с заданием времени отображения и возврата на предыдущую маску
    VAR_INPUT
        iMessage : USINT;    
        iTime    : USINT;   
        iEsc  : BOOL;
    END_VAR
    popup_StatePRG:=    StatePRG;
    StatePRG:= STATE_PRG_OFF;
    IF (iEsc) THEN
        ReturnToPrevMask:= TRUE;
    ELSE
        StoreMask();
        SaveMenuPos(); //081019 пробуем для возврата после сообщения в то же состояние
    END_IF;
    DTPopUp:=           iTime;// запускаем таймер всплывающего окна
    PopUp_Message:=     iMessage;
    Show_DTPopUp:=      TRUE;
    En_PopUpTimer:=     TRUE;
    Gotomask(PopUp_Message_Mask);

END_FUNCTION

FUNCTION ShowPopUpQuestion
    VAR_INPUT
        iQuestion : USINT;
    END_VAR
    popup_StatePRG:=    StatePRG;
    StatePRG:= STATE_PRG_OFF;
    StoreMask();
    //DTPopUp:=           0;  
    En_PopUpTimer:=     FALSE; // без таймера всплывающего окна
    PopUp_Question:=    iQuestion;
    Gotomask(PopUp_Question_Mask);

END_FUNCTION

FUNCTION ShowPopUpQuestion  //@Override с заданием сохранения параметров предыдущей маски
                            // используется когда нужно задать вопрос из маски вопроса не теряя ссылку на изначальную маску (iStoreMask = FALSE)
    VAR_INPUT
        iQuestion :     USINT;
        iNotStoreMask :  BOOL;
    END_VAR
    
    IF (iNotStoreMask) THEN
        ReturnToPrevMask:= TRUE;
    ELSE
        popup_StatePRG:=    StatePRG;
        StoreMask();
    END_IF;

    StatePRG:=          0;
    //DTPopUp:=           0; 
    En_PopUpTimer:=     FALSE; //без таймера всплывающего окна
    PopUp_Question:=    iQuestion;
    Gotomask(PopUp_Question_Mask);
    
END_FUNCTION
//
//FUNCTION ShowPopUpQuestion  // @Override с заданием времени отображения
    //VAR_INPUT
        //iQuestion : USINT;
        //iTime     : USINT;
    //END_VAR
    //popup_StatePRG:=    StatePRG;
    //StatePRG:= STATE_PRG_OFF;
    //StoreMask();
    //DTPopUp:=   iTime;      // запускаем таймер всплывающего окна
    //PopUp_Question:=   iQuestion;
    //Gotomask(PopUp_Question_Mask);
//
//END_FUNCTION

FUNCTION PopUpQuestion_Confirm
    StatePRG:=    popup_StatePRG;
    CASE PopUp_Question OF
        1:  // Перейти в индивидуальный режим
	        LocalMode:=     TRUE;
            StatePRG:= STATE_PRG_ALWAYS_ON;
            RestoreMask();
            GotoCursor(0,10);

        2:  // Cброс параметров
            Gotomask(Reboot);
            GeneralMng.Reset_Params:= TRUE;

        3:  // изменение типа электронагрева
            Gotomask(Reboot);
            HeatType:=      temp_HeatType; 
            En_Reboot:=     TRUE;  

        4:  // изменение роли устройства
            Gotomask(Reboot);
            Role:=          temp_Role;              
            //  Сброс состояний, т.к. после перезагрузки произойдет переопределение
            //Port_FBus2:= 	0;  
            FBus2.Protocol:= 	0; 
            //BMS2.Protocol:=	    0;
            BMS2.Protocol:=	    0;
            En_Reboot:=     TRUE;

        5:  // изменение настроек ModBus
            Gotomask(Reboot);
            MB_port:=       Temp_MB_port;
            MB_Address:=    Temp_MB_Address;
            CASE Temp_MB_port OF
                0:
                    Ethernet.Protocol[1]:=  255;
                    BMS_card.Protocol:=     255;
                    BMS2.Protocol:=         255;
                1:
                    
                    Ethernet.Protocol[1]:=  4;
                    BMS_card.Protocol:=     255;
                    BMS2.Protocol:=         255;
                2:
                    Ethernet.Protocol[1]:=  255;
                    BMS_card.Protocol:=     4;
                    BMS2.Protocol:=         255;
                    BMS_Card.Baudrate:= Temp_MB_Baudrate;
                    BMS_Card.StopBits:= Temp_MB_StopBits;
                    BMS_Card.Parity:=   Temp_MB_Parity;
                3:
                    Ethernet.Protocol[1]:=  255;
                    BMS_card.Protocol:=     255;
                    BMS2.Protocol:=         4;
                    BMS2.Baudrate:=     Temp_MB_Baudrate;
                    BMS2.StopBits:=     Temp_MB_StopBits;
                    BMS2.Parity:=       Temp_MB_Parity;
            END_CASE;
            En_Reboot:=   TRUE;

        6:  // Сохранить настройки Ethernet?
            write_EthernetSettings:= TRUE;
            PopUp_ESC();

        //7:  // Переход в начало первой конфигурации
            //GotoLoop(FIRST_CONFIG);
            //GotoCursor(0,10);

        8:  // Сброс статистики компрессора 1
            Reset_Hours_Circ1_Comp[1]:= TRUE; 
            PopUp_ESC();

        9:  // Сброс статистики компрессора 2
            Reset_Hours_Circ1_Comp[2]:= TRUE; 
            PopUp_ESC();

        10: // Сброс статистики компрессора 3
            Reset_Hours_Circ1_Comp[3]:= TRUE;
            PopUp_ESC();

        //11: // Вход в мастер конфигурации
            //GoToConfiguration();
        
        12: // Выход из мастера конфигураций
            GlobalEsc();

        13: // Запрос более высокого уровня доступа
            PwdIn:=     0;                 // Reset password
            IncrTmp:=   0;  
            PwdRes:=    0;
            EnLogOut:=  FALSE;
            CleanPwd();
            isPasswordRequest:= TRUE;
            GotoMask(Pwd_LogIn);

        14: //сброс конфигурации
            ConfigMng.clearConfig:= TRUE;
            CurLevel:= ConfigStartLevel; //возвращаемся к началу конфигуратора
            CurList_Position:= 1;
            PopUp_ESC();

        15: // изменение типа контроллера
            ConfigMng.setRButtons:=         TRUE;
            ConfigMng.setDefaultChoice:=    TRUE;
            //PopUp_ESC();            

        16: // загрузка конфигурации из конфигуратора
            GotoMaskID(5, 2); // DF_MID_LOAD

        //17: // загрузка конфигурации с флешки
            //IsConfigChanged:= TRUE;
            ////Load_Config();
            //load_Config:= TRUE;
            //ConfigMng.loadMask_Esc:= 1; //возврат в корень конфигуратора
            //GotoMask(LoadConfig_Mask);  

        18: // сброс ручного режима
            MaskMng.reset_ManualMode:= TRUE;
            PopUp_ESC();
            //IOMANAGE_MENU_ITEMS_NO:= 4; //скрываем пункт меню
            //RetIOManageMask();

        19: //сброс привязок вх/вых
            ConfigMng.release_IO:= TRUE;
            PopUp_ESC();

        20: //изменение настроек сети            
            Gotomask(Reboot);
            IF (Role_Slave) OR (is_TOP) THEN
                BMS2.Baudrate:=     Temp_MB_Baudrate;
                BMS2.StopBits:=     Temp_MB_StopBits;
                BMS2.Parity:=       Temp_MB_Parity;
            ELSE
                FBus2.Baudrate:=    Temp_MB_Baudrate;
                FBus2.StopBits:=    Temp_MB_StopBits;
                FBus2.Parity:=      Temp_MB_Parity;
            END_IF;
            En_Reboot:=   TRUE;

        21: // Сохранить конфигурацию при выходе
            //InstantAction:=  255; DF_END_CFG
            ConfigMng.ConfigVerify:= TRUE;

        22: // Загрузить параметры c USB
            GotoLoop(PARAM_MNG);
            Upgrade.CurDrive:= 1; //SYS_DISK_USB
            Upgrade.restoreParam:= TRUE;

        23: // Сохранить параметры на USB
            GotoLoop(PARAM_MNG);
            Upgrade.CurDrive:= 1; //SYS_DISK_USB
            Upgrade.storeParam:= TRUE;

        24: // Необходима перезагрузка! Перезагрузить?
            En_Reboot:= TRUE;

        25: // Сохранить изменения?
            MaskMng.setChanges:= TRUE;
            PopUp_ESC();

    END_CASE;
END_FUNCTION

FUNCTION PopUpQuestion_Reject
    CASE PopUp_Question OF
        //1:// Перейти в индивидуальный режим
            //StatePRG:= STATE_PRG_READY;// ????
            //GotoCursor(0,10);// ????
            //PopUp_ESC();  

        3:// изменение типа электронагрева
            StatePRG:= STATE_PRG_ON;
            PopUp_ESC();  
           
        5:// изменение настроек ModBus
            StatePRG:= STATE_PRG_ON;
            Temp_MB_port:= MB_port;
            Temp_MB_Address:= MB_Address;
            CASE Temp_MB_port OF
                0:
                    ;
                1:
                    ;
                2:
                    Temp_MB_Baudrate:= BMS_Card.Baudrate;
                    Temp_MB_StopBits:= BMS_Card.StopBits;
                    Temp_MB_Parity:= BMS_Card.Parity;
                3:
                    Temp_MB_Baudrate:= BMS2.Baudrate;
                    Temp_MB_StopBits:= BMS2.StopBits;
                    Temp_MB_Parity:= BMS2.Parity;
            END_CASE;
            Show_ports();   
            PopUp_ESC();

        16: // Отказ загружать конфигурацию с USB
            ConfigMng.CurDrive:= 0; 
            PopUp_ESC();  

        20: // настройки сети
            popup_StatePRG:= STATE_PRG_READY; 
            PopUp_ESC();            

        21: // Отказ сохранить конфигурацию при выходе 
            LoadMaskID(5, 0); //маска загрузки
    ELSE
        PopUp_ESC();        
    END_CASE;    

END_FUNCTION


FUNCTION PopUp_ESC
    StatePRG:=      popup_StatePRG;    
    En_PopUpTimer:= FALSE;

   // IF (isConfigMenu) THEN // в конфигураторе свои законы
        //LoadMenuPos();
    //    RestoreMask();
    IF (ReturnToPrevMask) THEN // возвращение на предыдущую маску
        ReturnToPrevMask:= FALSE;
        GlobalEsc();
    ELSE    // возвращение на ту маску, с которой пришли
        CASE popup_StatePRG OF
            3:  ModePRG:=           TRUE;
                NotModePRG:=        FALSE;
        END_CASE;
        RestoreMask();
        LoadMenuPos();
    END_IF;    
END_FUNCTION
// --------------------------------------------------------------------------------------------------// 

FUNCTION CheckAlarm                     // Check active alarms
    
    N_Alrms := GetAlarmsCount();        // Number of active alarms

    isAlarm := N_Alrms <> 0;      

    IF (N_Alrms > N_Alrms_Prev) THEN      // Activate the buzzer and alarm led if any alarm is present
        IF GeneralMng.RESERVED3 THEN       
        __SYSVA_MANUAL_BUZZER_ON:= TRUE;
        __SYSVA_MANUAL_BUZZER_OFF:= FALSE;
        END_IF;
        SetLedStatus(12,2);
        EnCheckAlarm := TRUE;  
        // Обновление списка активных аварий если находимся в маске "Нет аварий" или в списке активных аварий
        IF (isNoAlarmMask) OR (isActiveAlarmLoop)THEN
            CheckActiveAlarm();
        END_IF;                          
    ELSIF (N_Alrms = 0) AND (N_Alrms < N_Alrms_Prev) THEN // Turn off the buzzer and alarm led if there aren't active alarms
        __SYSVA_MANUAL_BUZZER_OFF:= TRUE;    
        __SYSVA_MANUAL_BUZZER_ON:= FALSE;    
        SetLedStatus(12,0);  
         // Обновление списка активных аварий если находимся в списке активных аварий
        IF (isActiveAlarmLoop) THEN            
            CheckActiveAlarm();       
        END_IF;  
    ELSIF N_Alrms < N_Alrms_Prev THEN  // когда количество аварий уменьшилось (но не равно 0) - обновляем список
        IF (isActiveAlarmLoop) THEN  
            CheckActiveAlarm();       
        END_IF;
    END_IF;
  
    N_Alrms_Prev := N_Alrms;             // Save the previous number of alarm to the actual
END_FUNCTION

//FUNCTION PreConfig           // Предконфигурация         
         //
        //IF GeneralMng.ID_Lang = -1 THEN         // If ID_Language = -1, it means that a Wipe Retain has just be done     
            //GeneralMng.ID_Lang:= 0;
            //LangTime:=      30;
            //EnLangChg:=     TRUE;
            //GotoMask(Language);
            //StatePRG:= STATE_PRG_ALWAYS_ON;
        //END_IF;
        //
        //IF (EnLangChg) THEN 
            //ShowLangMskTime();
        //ELSE            
            //IF NOT(langWasChanged) THEN
                //ChangeLanguage(GeneralMng.ID_Lang); // Configuration of language mask time after startup jump 
                //langWasChanged:= TRUE;
            //END_IF;
//
            //// Запрос на восстановление параметров после перезагрузки
            //IF (Upgrade.restoreParam) THEN
                //IF NOT(goto_RestoreParam) THEN
                    //StatePRG:= STATE_PRG_ALWAYS_ON;
                    //GotoMask(Restore_Param);
                    //GotoCursor(0,10);
                    //__TMP_BYTE:= 1;  
                    //goto_RestoreParam:= TRUE; 
                //ELSE
                    //CASE Upgrade.ANSW_RestoreParam OF 
                        //0: ; // ждём
                        //2: // восстановить
                            //MakeChoice:=                TRUE;                            
                            //Upgrade.restoreParam:=  FALSE;
                            //StatePRG:= STATE_PRG_OFF;
                            //CompletePreConfig:=         TRUE;
                    //ELSE // удалить, отложить
                        //MakeChoice:=                TRUE;                        
                        //Upgrade.restoreParam:=  FALSE;
                    //END_CASE;
                //END_IF;
            //ELSE
                //IF (CompletePreConfig) THEN// если конфигурация уже была пройдена 
                    //PreConfigCheck:=    TRUE; 
                    //GotoMain();
                //ELSE       
                    //IF NOT(goToConfig) THEN     
                        //goToConfig:=        TRUE;     
                        //NextCycleAction:=   7; // вызов конфигурации                        
                    //END_IF; 
                //END_IF;
            //END_IF;
        //END_IF;        
//END_FUNCTION

FUNCTION ShowLangMskTime
    // Language countdown of 30 seconds 
    IF (__SYSVA_KEY_PRESSED = 1) THEN
        LangTime:=              30;
        __SYSVA_KEY_PRESSED:=   0;
    END_IF;   
    IF (LangTime > 0) THEN
         LangTime := LangTime - 1;    
    ELSE
        EnLangChg := FALSE;
    END_IF;
END_FUNCTION
(*
FUNCTION ShowLangMskTime_DEL
    // Language countdown of 30 seconds       
    LangTime := LangTime - 1;    
    IF (LangTime = 0)AND NOT(GeneralMng.VerMismatch) AND (EnLangChg) THEN
        EnLangChg := FALSE;
        LangMsk_Esc ();
    END_IF;
END_FUNCTION
*)

FUNCTION LangMsk_Esc
    IF (EnLangChg) THEN
        EnLangChg:= FALSE;
    ELSE
        GlobalEsc();
    END_IF;
END_FUNCTION


FUNCTION Lang_UP                    // UP key function for Language selection
(*    300818 маска смены языка переработана
    IF GeneralMng.ID_Lang >= (GetLanguagesCount() - 1) THEN
        GeneralMng.ID_Lang := 0;
    ELSE            
        GeneralMng.ID_Lang := GeneralMng.ID_Lang + 1;
    END_IF;
    
    ChangeLanguage(GeneralMng.ID_Lang);
*)
END_FUNCTION

FUNCTION Lang_Rus                    // Переключение на русский язык   
    IF (GeneralMng.ID_Lang <> 0) THEN
        GeneralMng.ID_Lang := 0; 
	    LangRu:= TRUE;
	    LangEn:= FALSE;
        ChangeLanguage(GeneralMng.ID_Lang);
    END_IF;        
END_FUNCTION

FUNCTION Lang_Eng                    // Переключение на английский язык   
    IF (GeneralMng.ID_Lang <> 1) THEN
        GeneralMng.ID_Lang := 1;  
	    LangEn:= TRUE;
	    LangRu:= FALSE; 
        ChangeLanguage(GeneralMng.ID_Lang);
    END_IF;   
    
END_FUNCTION

FUNCTION Restore_Param// УДАЛИТь
	Compare();
    // Upgrade.restoreParam:= FALSE;
    // LangMsk_Esc ();
    
END_FUNCTION

(*
FUNCTION LogoFunc                              
        IF GeneralMng.ID_Lang = -1 THEN         // If ID_Language = -1, it means that a Wipe Retain has just be done     
            GeneralMng.ID_Lang:= 0;
            LangTime:=      30;
            EnLangChg:=     TRUE;
            GotoMask(Language);
            StatePRG = STATE_PRG_ALWAYS_ON;
            EnStartup:=     TRUE;
            FirstConfig:= TRUE; // 090718 первая конфигурация установки после сброса wipe retain
        END_IF;
        IF NOT(EnStartup) THEN
            ChangeLanguage(GeneralMng.ID_Lang); // Configuration of language mask time after startup jump           
            EnStartup:=     TRUE;
            
            // Запрос на восстановление параметров после перезагрузки
            IF (Upgrade.restoreParam) THEN
                GotoMask(Restore_Param);
                GotoCursor(0,10);
            ELSE
                GotoLoop (MAIN);
            END_IF; 
        END_IF;                                              
END_FUNCTION
*)

FUNCTION GotoMain                   
    //MaskPos:= MASK_POS_MAIN;
    //LoadMaskID(1, 0);  
    StatePRG:= STATE_PRG_OFF;        
    EnLangChg:= FALSE;

    ClearHistory();

    //GotoLoop (MAIN);
    GotoMaskID(1); //Main_Mask
END_FUNCTION

FUNCTION BlinkQuickMenu    
    // Blinking of quick menu icons
    IF DTQM = 1 AND IdxImgQM <(QUICK_MENU_ITEMS_NO + 1 )  THEN        
        DTQM := 0;                            
        IdxImgQM := IdxImgQM + QUICK_MENU_ITEMS_NO;
    ELSIF DTQM = 1 AND IdxImgQM > QUICK_MENU_ITEMS_NO THEN
        DTQM := 0;
        IdxImgQM := IdxImgQM - QUICK_MENU_ITEMS_NO;
    END_IF;
    DTQM := DTQM + 1;
END_FUNCTION

FUNCTION RetMainMsk

    // Automatic return to Main Mask after 5 minutes of inactivity and automatic Logout
    IF (__SYSVA_KEY_PRESSED = 1) THEN    
        DTRetMain := 0;               
        // LangTime := 30;
        // // для всплывающих окон.__SYSVA_KEY_PRESSED здесь обнуляется, поэтому вствка сюда----
        // IF (DTPopUp < (POPUP_TIME - 1)) THEN // __SYSVA_KEY_PRESSED сбрасывается секунду, поэтому сброс производим не раньше второй
            // DTPopUp:=          0;
            // En_DTPopUp:=    FALSE;
            // Show_DTPopUp:=  FALSE;
        // END_IF;
        // ----------------------------------------------------------------------------------
       __SYSVA_KEY_PRESSED := 0;
    ELSIF NOT(EnPwdChgM) AND (DTRetMain = 300) OR     (* !!! 300*)
             (EnPwdChgM) AND (DTRetMain = 1200)       (* 18.12.20 увеличено для ОТК *)
    THEN                       
        //MenuItemsNo := MAIN_MENU_ITEMS_NO;
        PwdIn := 0;
        EnLogOut := FALSE;
        IF (CurSlaveShow) THEN
            CurSlaveShow:=  FALSE;// сообщаем стратегии что прекращаем показывать текущего ведомого
            IF (GetAlarmsCount() > 0) THEN 
                SetLedStatus(12,1);// возвращаем управление колокольчиком основной программе 
            ELSE 
                SetLedStatus(12,0);
            END_IF;            
        END_IF;

        // 020718
        //IF (ManualManage) THEN
        //    ManualManage:= FALSE;
        //END_IF;
        NextCycleAction:=   11; // ManualManager(FALSE);

        StatePRG:= STATE_PRG_OFF;// гасим кнопку PRG

        resetConditions(); // 200219 добавлено что бы завершало все состояния при выходе

        GotoMain();
    END_IF;

    IF NOT(SystemPause) THEN //REF_CONFIGURATOR DF_MID_CFG_M
        DTRetMain := DTRetMain + 1;     // Delay for main mask return
    END_IF;
END_FUNCTION    

FUNCTION MskDateFormat
    CASE GeneralMng.DateFormat OF

        0://  DD/MM/YY
          Date1 := GeneralMng.Day;
          Date2 := GeneralMng.Month;
          Date3 := GeneralMng.Year;

        1://  MM/DD/YY
          Date1 := GeneralMng.Month; 
          Date2 := GeneralMng.Day;
          Date3 := GeneralMng.Year;

        2://  YY/MM/DD
          Date1 := GeneralMng.Year;
          Date2 := GeneralMng.Month;
          Date3 := GeneralMng.Day;

    END_CASE;
END_FUNCTION

FUNCTION UsrAccessMenu
    IF CntDwnPwdTypMenu > 0 THEN
        CntDwnPwdTypMenu := CntDwnPwdTypMenu - 1;
    ELSIF CntDwnPwdTypMenu = 0 THEN
        PwdTypMenu := 0;
    END_IF;
END_FUNCTION

FUNCTION CheckAlrm_Reset
    // Check the active alarms after a Global/Single alarm reset
    IF En_CheckAlrm_Reset THEN
        IF N_Alrms = 0 THEN
            GotoMask(Alrms_NoAlrms);      
        ELSE          
            CheckActiveAlarm();
        END_IF;
        En_CheckAlrm_Reset := FALSE;
    END_IF;
END_FUNCTION

FUNCTION CheckActiveAlarm  
              
    VAR
        infoOk:DINT;
    END_VAR
    
    //MaskPos:= MASK_POS_MAIN;
    SetLedStatus(7,0);
    EnCheckAlarm := FALSE;

    N_Alrms := GetAlarmsCount();            // Get active alarms number

    __SYSVA_MANUAL_BUZZER_OFF:= TRUE;       // Every time i enter alarm mask, turn off the buzzer
    __SYSVA_MANUAL_BUZZER_ON:= FALSE;


    IF N_Alrms > 0 THEN                     // If there's a new alarm and alarm key is pressed,                                 
        SetLedStatus(12, 1);                // then fix the alarm led
        AlrmIdx := 1;
        infoOk:= GetAlarmInfo(AlrmIdx, AlrmCode , AlarmMng.AlrmTime); // Call GetAlarmInfo to show first alarm active
        CheckStoredVar_Alrm();
        isActiveAlarmLoop:= TRUE;
        isNoAlarmMask:=     FALSE;
        GotoLoop(ACTIVEALARMS);
    ELSE
        AlrmIdx := 0;
        SetLedStatus(12, 0);                
        IF __SYSVA_KEY_COUNTER <= 1 THEN
            isNoAlarmMask:=     TRUE;
            isActiveAlarmLoop:= FALSE;
            GotoMask(Alrms_NoAlrms);        // If there are no active alarms, goto no_alarms loop
        ELSIF __SYSVA_KEY_COUNTER >= 3 THEN // Try to reset alarms also if no alarms(due to remote devices)
            ResetAlarms();
            AlarmMng.AlrmResByPGD1:=TRUE;
            AlrmIdx:= 0;
        END_IF;
    END_IF;
END_FUNCTION

FUNCTION CheckStoredVar_Alrm                                                  // This function let you sample the sampled variables on Alarm table
    
    // --- Active alarms ---// 
    IF GetAlarmStoredVar(AlrmIdx, 1, AlrmStoredVarReal1) <> 0 THEN            // Control if there's any variable to be sampled
        EnStoredVar1_REAL := FALSE;                                           // If is present, enable the fields
    ELSE
        EnStoredVar1_REAL := TRUE;                                            // else, don't enable the fields
    END_IF;

    IF GetAlarmStoredVar(AlrmIdx, 2, AlrmStoredVarReal2) <> 0 THEN
        EnStoredVar2_REAL := FALSE;     
    ELSE
        EnStoredVar2_REAL := TRUE; 
    END_IF;
    
END_FUNCTION

FUNCTION gotoAlarmLog        
                                
    AlrmLogsTot:= GetAlarmLogsCount();
    // Show last alarm log                            
    IF AlrmLogsTot > 0 THEN                                       
        AlrmLogsIdx:=1;
        infoLogOk:=GetAlarmLogInfo(AlrmLogsIdx, AlrmLogCode,  AlrmLogEventType, AlarmMng.AlrmLogTime);// CheckStoredVar_Alrm была здесь перед AlrmLogEventType. ОТКУДА ВЗЯЛАСЬ????
        CheckStoredVar_Log(); 
    ELSE
        AlrmLogsIdx:=0;
        infoLogOk:=-1;
    END_IF;

    IF infoLogOk = 0 THEN                                         
        LastValidRecord:= AlrmLogsIdx;
        GotoLoop(ALRMLOGS);
    ELSE
        GotoMask(Alrms_NoLog);                                   
    END_IF;

END_FUNCTION

FUNCTION CheckStoredVar_Log                                                   // This function let you sample the sampled variables on Alarm table
    
    // --- Logged alarms ---// 
    IF GetAlarmLogStoredVar(AlrmLogsIdx, 1, AlrmStoredVarReal1) <> 0 THEN 
        EnStoredVar1_REAL := FALSE;                                           // If is present, enable the fields
    ELSE
        EnStoredVar1_REAL := TRUE;                                            // else, don't enable the fields
    END_IF;
    
    IF GetAlarmLogStoredVar(AlrmLogsIdx, 2, AlrmStoredVarReal2) <> 0 THEN
        EnStoredVar2_REAL := FALSE;     
    ELSE
        EnStoredVar2_REAL := TRUE; 
    END_IF;
    
END_FUNCTION

FUNCTION Slave_Alrms_Esc    

    CurSlaveAlarmShow:= FALSE;// сообщаем стратегии что прекращаем показывать аварии текущего ведомого    

    RestoreMask();

    GotoCursor(0,10);

    IF (StatePRG=4) THEN StatePRG:= STATE_PRG_READY;
    END_IF;

END_FUNCTION

FUNCTION DoNothing
END_FUNCTION

FUNCTION ScrollAlarmLog_UP 
     
    IF AlrmLogsIdx = 1 THEN                                         // If I'm displaying the first log alarm, then beep              
        Beep();
    ELSE
        AlrmLogsIdx:= AlrmLogsIdx-1;                                // else, decrease the alarm log index
        AlrmLogsIdxTemp:= AlrmLogsIdxTemp - 1;                      
        AlrmLogInfoErr:=GetAlarmLogInfo(AlrmLogsIdx, AlrmLogCode,   // Get information about alarm logs
                                    AlrmLogEventType, AlarmMng.AlrmLogTime);
        CheckStoredVar_Log();                                           // Show me sampled values if there are
    END_IF;
                                                     
END_FUNCTION

FUNCTION ScrollAlarmLog_DOWN  
  
    AlrmLogsIdxTemp := AlrmLogsIdx;
    AlrmLogsIdxTemp:= AlrmLogsIdxTemp + 1;
    AlrmLogInfoErr:=GetAlarmLogInfo(AlrmLogsIdxTemp, AlrmLogCodeTemp,       // Get information about alarm logs
                                    AlrmLogEventTypeTemp, AlrmLogTimeTemp);
    IF AlrmLogInfoErr = 1 THEN                                              // If I'm displaying the last log alarm, then beep
        Beep();
    ELSE
        IF AlrmLogsIdx < 999 THEN
            AlrmLogsIdx:= AlrmLogsIdx + 1;                                   // else, increase the alarm log index 
            AlrmLogInfoErr:=GetAlarmLogInfo(AlrmLogsIdx, AlrmLogCode,        // Get information about alarm logs
                                        AlrmLogEventType, AlarmMng.AlrmLogTime);
            CheckStoredVar_Log();                                                // Show me sampled values if there are
        ELSE
            AlrmLogsIdx := 999;
            Beep();
        END_IF;    
    END_IF;
   
END_FUNCTION

FUNCTION LedBlink 
    SetLedStatus(12,2);
END_FUNCTION

FUNCTION ResetSingleAlarm
    IF N_Alrms = 0 OR EnCheckAlarm = TRUE THEN                                  
        CheckActiveAlarm();
        EnCheckAlarm := FALSE;
        GotoMask(Alrms_NoAlrms);// возвращаемся на маску НЕТ АВАРИЙ
    END_IF;

    IF __SYSVA_KEY_COUNTER = 1 THEN         // Reset only the alarm that I'm displaying
        KeyAlarmAutorepeatActive := FALSE;
    ELSIF(__SYSVA_KEY_COUNTER >= 3) AND 
         (KeyAlarmAutorepeatActive=FALSE) THEN
        KeyAlarmAutorepeatActive := TRUE;
        ResetAlarm(AlrmIdx);
        En_CheckAlrm_Reset := TRUE;         // Enable the CheckAlrm_Reset function
    END_IF;
END_FUNCTION

FUNCTION ScrollAlarm_UP                                // Navigation trought active alarm mask
                                        
    N_Alrms := GetAlarmsCount();                       // Get active alarms count
    IF N_Alrms > 0 THEN                                // If there are active alarms,
        IF AlrmIdx > 1 AND AlrmIdx <= N_Alrms THEN     // and i'm not in the last alarm, then show me the previous alarm
            AlrmIdx:= AlrmIdx-1;
        ELSIF AlrmIdx = 1 THEN                         // If i'm in the last alarm, show next mask(Alarm_Reset)
            AlrmIdx:= 0;
            GotoPreviousMask();
        ELSIF AlrmIdx = 0 AND N_Alrms <> 0 THEN        // If i'm in the "Alarm_Reset" mask, go to Alarm_Active mask
            AlrmIdx := N_Alrms;
            GotoPreviousMask(); 
        END_IF;
        GetAlarmInfo(AlrmIdx, AlrmCode, AlarmMng.AlrmTime);     // Get alarm info by index
        CheckStoredVar_Alrm(); 
    ELSIF N_Alrms = 0 THEN                             // If there are no alarms, show No_alarms mask
        GotoMask(Alrms_NoAlrms);
    END_IF;

END_FUNCTION

FUNCTION ScrollAlarm_DOWN                              // Navigation trought active alarm mask

    N_Alrms := GetAlarmsCount();                       // Get active alarms count
    IF AlrmIdx = 0 AND N_Alrms <> 0 THEN               // If i'm in the "Alarm_Reset" mask, go to Alarm_Active mask
        GotoNextMask();
    END_IF; 
                                            
    IF N_Alrms >= 0 AND N_Alrms <> 0 THEN              // If there are active alarms,
        IF AlrmIdx >= 0 AND AlrmIdx < N_Alrms THEN     // and i'm not in the last alarm, then show me the next alarm
            AlrmIdx:= AlrmIdx+1;
        ELSIF AlrmIdx >= N_Alrms THEN                  // If i'm in the last alarm, show next mask(Alarm_Reset)
            AlrmIdx:= 0;
            GotoNextMask();
        END_IF;
        GetAlarmInfo(AlrmIdx, AlrmCode, AlarmMng.AlrmTime);     // Get alarm info by index
        CheckStoredVar_Alrm(); 
    ELSIF N_Alrms = 0 THEN                             // If there are no alarms, show No_alarms mask 
        GotoMask(Alrms_NoAlrms);
    END_IF;

END_FUNCTION

FUNCTION ResetGlobalAlarm 
    IF (__SYSVA_KEY_COUNTER >= 3) OR (Cmd_ResetAlarms) THEN        // If I hold down the alarm button for more 
        Cmd_ResetAlarms:= FALSE;
        IF (PwdTyp >= 2) THEN
            ResetAlarms();                  // than 3 seconds then resets all alarms
            AlarmMng.AlrmResByPGD1 := TRUE;           
            AlrmIdx:= 1;
            En_CheckAlrm_Reset := TRUE;     // Enable the CheckAlrm_Reset function
            IF (UnitOff) AND 
                NOT(Reserve.Use)            //181120 Не сбрасываем выключатель при резервировании
            THEN                            
                KeybOnOff:= FALSE;          //270919 Сброс выключателя при сбросе аварий, 
                                            //что бы установка не запускалась сразу после сброса
            END_IF;
        ELSE   
            ShowPopUpQuestion(13);          // Запрос более высокого уровня доступа                      
        END_IF;
    END_IF;
END_FUNCTION

FUNCTION Slave_Alrms_ALARM
	IF (__SYSVA_KEY_COUNTER >= 3) THEN
        SlaveAlrmRes[CurSlave]:= TRUE;
    END_IF;
END_FUNCTION

FUNCTION Slave_Alrms_UP

    IF (Slave_AlrmIdx > 1) AND (Slave_AlrmIdx <= Slave_N_Alrms) THEN     // and i'm not in the last alarm, then show me the previous alarm
            Slave_AlrmIdx:= Slave_AlrmIdx-1;
    ELSIF (Slave_AlrmIdx = 1) THEN                         // If i'm in the last alarm, show next mask(Alarm_Reset)
            Slave_AlrmIdx:= 0;
            GotoPreviousMask();
    ELSIF (Slave_AlrmIdx = 0) AND (Slave_N_Alrms <> 0) THEN        // If i'm in the "Alarm_Reset" mask, go to Alarm_Active mask
            Slave_AlrmIdx := Slave_N_Alrms;
            GotoPreviousMask(); 
    END_IF;

END_FUNCTION

FUNCTION Slave_Alrms_DOWN

    IF (Slave_AlrmIdx >= 1) AND (Slave_AlrmIdx < Slave_N_Alrms) THEN     // and i'm not in the last alarm, then show me the previous alarm
            Slave_AlrmIdx:= Slave_AlrmIdx+1;
    ELSIF (Slave_AlrmIdx = Slave_N_Alrms) THEN                         // If i'm in the last alarm, show next mask(Alarm_Reset)
            Slave_AlrmIdx:= 0;
            GotoNextMask();
    ELSIF (Slave_AlrmIdx = 0) AND (Slave_N_Alrms <> 0) THEN        // If i'm in the "Alarm_Reset" mask, go to Alarm_Active mask
            Slave_AlrmIdx := 1;
            GotoNextMask(); 
    END_IF;

END_FUNCTION

FUNCTION GotoMainMenu                           
    IF (Display.MaskID <> DF_MID_MMENU) THEN
        IF EnLogOut = FALSE THEN
            GotoMaskID(2); //Pwd_LogIn
        ELSE
            CurMenuPoint:=  0;
            CurLevel:=      1;
            GotoMaskID(3); //Menu_Main
        END_IF;

        PwdTypMenu:=        PwdTyp;
        CntDwnPwdTypMenu:=  5;

        StatePRG:=          STATE_PRG_OFF;
        CurRow:=            1;
        CurList_Position:=  1;
        //InitDisplay();
    END_IF;
END_FUNCTION

FUNCTION InitDisplay
    CurRow:= 0;
    //cnt_Items:= 0;
    Display.Path.MenuPoint[CurLevel]:= 0;
    getParamMenu:= TRUE;
END_FUNCTION

FUNCTION QuickMenuUP              
    IdxQM:= IdxQM + 1;
    IF (IdxQM > QUICK_MENU_ITEMS_NO) THEN
        IdxQM:=     1;
        IdxImgQM:=  1;
    ELSE
        IdxImgQM:= IdxImgQM + 1; 
    END_IF;   

    CASE ModelLine OF
        2: // DLE
            IF (IdxQM = 3) THEN // Пропускаем ХМ
                IdxQM:=     IdxQM + 1;
                IdxImgQM:=  IdxImgQM + 1;
            END_IF;

        3,4,5 : // POOL, ICE, CCU
            IF (IdxQM = 4) THEN //пропускаем Группу
                IdxQM:=     IdxQM + 1;
                IdxImgQM:=  IdxImgQM + 1;
            END_IF; 
        7: //ICEnoCM
            IF (IdxQM = 3) THEN // Пропускаем ХМ
                IdxQM:=     IdxQM + 1;
                IdxImgQM:=  IdxImgQM + 1;
            END_IF;  
            IF (IdxQM = 4) THEN //пропускаем Группу
                IdxQM:=     IdxQM + 1;
                IdxImgQM:=  IdxImgQM + 1;
            END_IF;            
    END_CASE; 

    IF (IdxQM = 5) AND NOT(EQ_Humid.Use) THEN // Пароувлажнитель
        IdxQM:= IdxQM + 1;
        IdxImgQM:=  IdxImgQM + 1;
    END_IF;

END_FUNCTION

FUNCTION QuickMenuDOWN           
    IdxQM:= IdxQM - 1;
    IF (IdxQM < 1) THEN
        IdxImgQM:= QUICK_MENU_ITEMS_NO;
        IdxQM:= QUICK_MENU_ITEMS_NO;
    ELSE
        IdxImgQM := IdxImgQM - 1;    
    END_IF; 

    IF (IdxQM = 5) AND NOT(EQ_Humid.Use) THEN // Пароувлажнитель
        IdxQM:= IdxQM - 1;
        IdxImgQM:=  IdxImgQM - 1;
    END_IF;

    CASE ModelLine OF
        2: // DLE
            IF (IdxQM = 3) THEN // Пропускаем ХМ
                IdxQM:=     IdxQM - 1;
                IdxImgQM:=  IdxImgQM - 1;
            END_IF;

        3,4,5 : // POOL, ICE, CCU 
            IF (IdxQM = 4) THEN //пропускаем Группу
                IdxQM:=     IdxQM - 1;
                IdxImgQM:=  IdxImgQM - 1;
            END_IF; 
        7: //ICEnoCM
            IF (IdxQM = 4) THEN // Пропускаем ХМ
                IdxQM:=     IdxQM - 1;
                IdxImgQM:=  IdxImgQM - 1;
            END_IF;  
            IF (IdxQM = 3) THEN //пропускаем Группу
                IdxQM:=     IdxQM - 1;
                IdxImgQM:=  IdxImgQM - 1;
            END_IF;                     
    END_CASE;     
END_FUNCTION

FUNCTION QuickMenuENT           
    //MaskPos:= MASK_POS_MAIN;

    CASE IdxQM OF

        1: // ВКЛ/ВЫКЛ       
            GotoMaskID(4); //ONOFF     

        2:  // Установка температуры
           // GotoMaskID(15); //SET
           //Набор уставок	DF_MID_PSET
            GotoMaskID(43); //PRESETS

        3:  // ХМ
            GotoMaskID(40); // DF_MID_COLM

        4:  // Сеть
            GotoMaskID(41); // DF_MID_NETM

        5:  // Пароувлажнитель   
            GotoMaskID(44); // DF_MID_INFO

        6:  // Инфо 
            GotoMaskID(42); // DF_MID_INFO

        7:  // Последовательности
            GotoMaskID(9); // DF_MID_SEQ

    END_CASE; 
END_FUNCTION

FUNCTION CompareOnly
	 Compare();
END_FUNCTION

FUNCTION EscDummyManuf
    RestoreMask();
    SetLedStatus(7,0);
END_FUNCTION

FUNCTION EscDummyService
    (* !!!
    RestoreMask();
    SetLedStatus(7,0);
    *)
END_FUNCTION

FUNCTION Move_CurLeft   // двигаем курсор влево

    CurShow[CurPosition]:=  FALSE;

    IF (CurPosition = 1) THEN
        CurPosition:=   Num_Slaves;
    ELSE CurPosition:=  CurPosition - 1;
    END_IF;
    
    CurShow[CurPosition]:=  TRUE;

END_FUNCTION

FUNCTION Move_CurRight   // двигаем курсор вправо

    CurShow[CurPosition]:=  FALSE;

    IF (CurPosition = Num_Slaves) THEN
        CurPosition:= 1;
    ELSE CurPosition:= CurPosition + 1;
    END_IF;
    CurShow[CurPosition]:=  TRUE;


END_FUNCTION

FUNCTION NetMapEsc 
    CurShow[CurPosition]:=  FALSE;// для карты сети. гасим указатель.
    GotoMain();        
END_FUNCTION

FUNCTION GlobalEsc

    ReStoreMaskID(); //Восстанавливаем предыдущий MaskID
    CASE Display.MaskID OF 
        0,1: //Гл.экран
            GotoMain(); 
        3: //Осн.меню
            StatePRG:= STATE_PRG_READY;
            //LoadMaskID(3, 0); //DF_MID_MMENU
            LoadMenuPos();
            //RestoreMask();
        10: //Конфигуратор
            //LoadMaskID(10, 0);
            LoadMenuPos();
    END_CASE;
    resetConditions();
        
    ModePRG:=       FALSE; // !!!!
    NotModePRG:=    TRUE; // !!! 
END_FUNCTION

FUNCTION resetConditions
    IF (StatePRG = 4) THEN 
        StatePRG:= STATE_PRG_READY;
    ELSE
        StatePRG:= STATE_PRG_OFF;        
    END_IF;

    isActiveAlarmLoop:= FALSE;
    isNoAlarmMask:= FALSE;

    CurRow_modePRG:= 0;   

END_FUNCTION

FUNCTION OnOffSwitch_UP   //Unit onoff
    //IF (Role = 0) THEN 
        //KeybOnOff := TRUE;  //переключение ведущим
    //ELSE
        //IF (LocalMode) THEN 
            //KeybOnOff := TRUE;  //переключение ведомым в индивидуальном режиме
        //ELSE //ссылка на переключение в индивидуальный режим
            //Set_PRG();
        //END_IF;
    //END_IF;
    KeybOnOff := TRUE; 
END_FUNCTION

FUNCTION OnOffSwitch_DOWN   //Unit onoff
    //IF (Role = 0) THEN 
        //KeybOnOff := FALSE;  //переключение ведущим
    //ELSE
        //IF (LocalMode) THEN 
            //KeybOnOff := FALSE;  //переключение ведомым в индивидуальном режиме
        //ELSE //ссылка на переключение в индивидуальный режим
            //Set_PRG();
        //END_IF;
    //END_IF;
    KeybOnOff := FALSE;
END_FUNCTION

FUNCTION Set_PRG

    IF (Role_Slave)AND(LocalMode = 0) THEN
        StatePRG:= STATE_PRG_ALWAYS_ON;
        ShowPopUpQuestion(1); // Перейти в индивидуальный режим?
    ELSE
        setParam:= TRUE;
        //StatePRG:= STATE_PRG_OFF;
        //GotoMainMenu();
    END_IF;

END_FUNCTION

FUNCTION Set_UP
	IF (Role_Slave) THEN
        IF (LocalMode) THEN 
            Display.value_REAL[1]:= Display.value_REAL[1] + TO_REAL(__SYSVA_KEY_COUNTER)/10.0;
            IF (Display.value_REAL[1] > Display.value_MaxREAL[1]) THEN
                Display.value_REAL[1]:= Display.value_MinREAL[1];  
                __SYSVA_KEY_COUNTER:= 0;       
                Beep();       
            END_IF;
        ELSE 
            Set_PRG();
        END_IF; 
    ELSE
        Display.value_REAL[1]:= Display.value_REAL[1] + TO_REAL(__SYSVA_KEY_COUNTER)/10.0;
        IF (Display.value_REAL[1] > Display.value_MaxREAL[1]) THEN
            Display.value_REAL[1]:= Display.value_MinREAL[1];  
            __SYSVA_KEY_COUNTER:= 0;       
            Beep();       
        END_IF;
    END_IF;

    // Для стрелок
    upArrow:= TRUE;
END_FUNCTION

FUNCTION Set_DOWN
	IF (Role_Slave) THEN 
        IF (LocalMode) THEN
            Display.value_REAL[1]:= Display.value_REAL[1] - TO_REAL(__SYSVA_KEY_COUNTER)/10.0;
            IF (Display.value_REAL[1] < Display.value_MinREAL[1]) THEN
                Display.value_REAL[1]:= Display.value_MaxREAL[1];  
                __SYSVA_KEY_COUNTER:= 0;       
                Beep();       
            END_IF;
        ELSE 
            Set_PRG();
        END_IF;
    ELSE
        Display.value_REAL[1]:= Display.value_REAL[1] - TO_REAL(__SYSVA_KEY_COUNTER)/10.0;
        IF (Display.value_REAL[1] < Display.value_MinREAL[1]) THEN
            Display.value_REAL[1]:= Display.value_MaxREAL[1];  
            __SYSVA_KEY_COUNTER:= 0;       
            Beep();       
        END_IF;
    END_IF;

    // Для стрелок
    downArrow:= TRUE;
END_FUNCTION

FUNCTION SET_ENTER

    setParam:= TRUE;

END_FUNCTION

FUNCTION SlaveSet_ENTER
    
IF (StatePRG = STATE_PRG_ON) THEN
    Compare();

    (* Перенесено в стратегию, т.к. маски не умеют обрабатывать массивы структур *)
    ApplyCurSettings:= TRUE;
    (*IF (__SYSVA_CURSOR_ROW = 3) THEN SlaveMode[CurSlave]:=      CurMode;       
	ELSIF (__SYSVA_CURSOR_ROW = 5) THEN SlaveOnOff[CurSlave]:=	CurOnOff;
    ELSIF (__SYSVA_CURSOR_ROW = 6) THEN SlaveSP[CurSlave]:=     CurSP;
    END_IF;*)

    GotoNextField();
END_IF;
END_FUNCTION

FUNCTION SlaveState_ALARM

    StoreMask();
    IF (CurState = 8) THEN
        ShowPopUpMessage(3, POPUP_TIME);            //Сообщение: Ведомый не в сети!
    ELSE    
        IF (WORDs_SlaveAlarms[CurSlave] = 0) THEN   // если нет аварий, переходим на маску "Нет аварий"
            GotoMask(Slave_NoAlrms);
        ELSE
            Slave_AlrmIdx:=     1;
            CurSlaveAlarmShow:= TRUE;// сообщаем стратегии что сейчас будем показывать аварии текущего ведомого        
	        GotoLoop(SLAVEALARMS); (*переходим в петлю аварий ведомых устройств*)
        END_IF;
    END_IF;

END_FUNCTION

FUNCTION SlaveState_PRG

    IF (StatePRG = STATE_PRG_READY) THEN 
        StoreMask();
        StatePRG:= STATE_PRG_ON;   
        NextCycleAction:=   1;
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        Compare(); 
        (* Перенесено в стратегию, т.к. маски не умеют обрабатывать массивы структур *)
        ApplyCurSettings:= TRUE;
        (*IF (__SYSVA_CURSOR_ROW = 3) THEN SlaveMode[CurSlave]:= CurMode;       
	    ELSIF (__SYSVA_CURSOR_ROW = 5) THEN SlaveOnOff[CurSlave]:=	CurOnOff;
        ELSIF (__SYSVA_CURSOR_ROW = 6) THEN Units[CurSlave].SetPoint:= CurSP;
        END_IF;       *)

        StatePRG:= STATE_PRG_READY;        
        NextCycleAction:=   1;
    END_IF;
    
END_FUNCTION

FUNCTION DOWN_button
    (*IF (StatePRG = STATE_PRG_OFF)OR(StatePRG = STATE_PRG_READY) THEN 
        IF (CurSlaveShow)THEN
            IF (CurSlave<Num_Slaves) THEN CurSlave:=CurSlave+1;
            ELSE CurSlave:=1;
            END_IF;        
        ELSE Move_DOWN();  
        END_IF;
    // ELSIF (StatePRG = STATE_PRG_ON) THEN GotoNextField();
    END_IF;*)

    IF (StatePRG = STATE_PRG_OFF)OR(StatePRG = STATE_PRG_READY) THEN 
        Move_DOWN();  
    END_IF;

END_FUNCTION

FUNCTION UP_button
 (*   IF (StatePRG = STATE_PRG_OFF)OR(StatePRG = STATE_PRG_READY) THEN 
        IF (CurSlaveShow)THEN
            IF (CurSlave<Num_Slaves) THEN CurSlave:=CurSlave+1;
            ELSE CurSlave:=1;
            END_IF;        
        ELSE Move_DOWN();  
        END_IF;
    // ELSIF (StatePRG = STATE_PRG_ON) THEN GotoPreviouseField();
    END_IF;*)

    IF (StatePRG = STATE_PRG_OFF)OR(StatePRG = STATE_PRG_READY) THEN 
            Move_UP();  
    END_IF;
END_FUNCTION

FUNCTION PwdLogOut        // Function for Logout  
    //MaskPos:= MASK_POS_MAIN;                   
    //EnLogOut := FALSE;
    //PwdTyp := 0;
    //PwdIn := 0;
    //PwdRes := 0;
    //PwdTypMenu := PwdTyp;
    //// PwdManuf := FALSE;   
    //
//
    //SetLedStatus(7,0);
    //IdxMenuMsk := 0;                   
    //BarPos := 0;              
    //CurrItemNo := 1;
    //IdxImg1 := 1;         // Icon management
    //IdxImg2 := 2;
    //IdxImg3 := 4;
//
    //GotoLoop (MAIN);
    //270619

    EnLogOut := FALSE;
    PwdTyp := 0;
    PwdIn := 0;
    PwdRes := 0;
    PwdTypMenu := PwdTyp;
    PwdDev := FALSE;  
    StatePRG:= STATE_PRG_OFF;
    
    ClearHistory();
    LoadMaskID(1, 0); // Main_Mask
END_FUNCTION


FUNCTION CleanPwd
        hide_PassDigit1:= FALSE;
        hide_PassDigit2:= FALSE;
        hide_PassDigit3:= FALSE;
END_FUNCTION

FUNCTION PwdLogIn
    Compare();     
    IncrTmp := IncrTmp + 1;                         // Increment the cursor position                                             
    GotoRightDigit();

    // Скрытие пароля за звездочками
    CASE IncrTmp OF
        1: hide_PassDigit1:= TRUE;
        2: hide_PassDigit2:= TRUE;
        3: hide_PassDigit3:= TRUE;
    ELSE
        CleanPwd();
    END_CASE;

    IF PwdIn <> GeneralMng.PwdUser AND PwdIn <> GeneralMng.PwdService     // If password is wrong THEN reset password and say that is wrong
    AND PwdIn <> GeneralMng.RESERVED1  AND PwdIn <> 9274 AND IncrTmp = 4 THEN // AND PwdIn <> GeneralMng.RESERVED2  Developer password: 9274
        __SYSVA_TMP_VALUE:= 0;
        PwdRes:=    1;
        IncrTmp:=   0;
        EnLogOut:=  FALSE;     
    
    ELSIF PwdIn = 9274 AND IncrTmp = 4 THEN // If password is a PASSE PAR TOUT password THEN login as MANUFACTURER and enable        GeneralMng.RESERVED2   IDDQD 9274
        PwdTyp:=    4;                      // Manufacturer Service and User passwords change
        EnLogOut:=  TRUE;
        EnPwdChgU:= TRUE;
        EnPwdChgS:= TRUE;
        EnPwdChgM:= TRUE;
        // PwdManuf:= TRUE;                 // флаг заводского доступа
        PwdDev:=    TRUE;                   // флаг доступа разработчика
        //MaskPos:= MASK_POS_MAIN;
        //GotoLoop(MAIN_MENU);   

    ELSIF PwdIn = GeneralMng.RESERVED1 AND IncrTmp = 4 THEN     // If password is a MANUFACTURER password THEN login as MANUFACTURER and enable 
        PwdTyp:=    3;                                // Manufacturer Service and User passwords change
        EnLogOut:=  TRUE;
        EnPwdChgU:= TRUE;
        EnPwdChgS:= TRUE;
        EnPwdChgM:= TRUE;
        // PwdManuf:=   TRUE;                  // флаг заводского доступа
        //MaskPos:= MASK_POS_MAIN;
        //GotoLoop(MAIN_MENU);
           
    ELSIF PwdIn = GeneralMng.PwdService AND IncrTmp = 4 THEN   // If password is a SERVICE password THEN login as SERVICE and enable 
        PwdTyp:=    2;                                // Service and User passwords change
        EnLogOut:=  TRUE;
        EnPwdChgU:= TRUE;
        EnPwdChgS:= TRUE;
        EnPwdChgM:= FALSE;
        //MaskPos:= MASK_POS_MAIN;
        //GotoLoop(MAIN_MENU);

    ELSIF PwdIn = GeneralMng.PwdUser AND IncrTmp = 4 THEN    // If password is a USER password THEN login as USER and enable 
        PwdTyp:=    1;                                      // User password change
        EnLogOut:=  TRUE;
        EnPwdChgU:= TRUE;
        EnPwdChgS:= FALSE; 
        EnPwdChgM:= FALSE;
        //MaskPos:= MASK_POS_MAIN;       
        
    END_IF;
  
    // Пересчет видимости меню и параметров при изменении уровня доступа
    IF  (Prepare_2.EnPwdChgM <> EnPwdChgM)OR
        (Prepare_2.EnPwdChgS <> EnPwdChgS)OR
        (Prepare_2.EnPwdChgU <> EnPwdChgU) 
    THEN
        MainMenuVisibility_Is_Set:= FALSE; 
        ParamVisibility_Is_Set:=    FALSE; 
        Prepare_2.EnPwdChgS:= EnPwdChgS;
        Prepare_2.EnPwdChgM:= EnPwdChgM; 
        Prepare_2.EnPwdChgU:= EnPwdChgU;  
    END_IF;
   
    PwdTypMenu := PwdTyp;
    CntDwnPwdTypMenu := 5;

    IF (EnLogOut) THEN
        IF (isPasswordRequest) THEN
            IF (PwdTyp >= 2) THEN
                isPasswordRequest:= FALSE;
                RestoreMask();
                //NextCycleAction:=   10;  Теперь аварии можно сбросить! 
                Cmd_ResetAlarms:=   TRUE;
                ResetGlobalAlarm();
            ELSE
                RestoreMask();
                NextCycleAction:=   9; // Запрос более высокого уровня доступа   
            END_IF;                  
        ELSE
            //210619 !!! GotoLoop(MAIN_MENU);
            //GotoMask(Menu_Main);
            //Display.MaskID:= 3; //Menu_Main
            //getMainMenu:= TRUE;
            CurRow:= 1;       
            CurMenuPoint:= 0;
            CurLevel:= 1;     
            LoadMaskID(3, 0); //Menu_Main
        END_IF;
    END_IF;

END_FUNCTION

FUNCTION DecrDig
    DecrementDigit();
END_FUNCTION

FUNCTION IncrDig
    IncrementDigit();
END_FUNCTION

FUNCTION PRG_button

    IF (StatePRG = STATE_PRG_READY) THEN 
        IF (is_TOP) AND (FLR_Disc_CTRL.Active) THEN
            ShowPopUpMessage(8, POPUP_TIME);//  Нет связи со шкафом управления!// если ведомый - заглушка
        ELSE
            StoreMask();
            StatePRG:= STATE_PRG_ON;     
            NextCycleAction:=   1;
        END_IF;
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        Compare();        
        StatePRG:= STATE_PRG_READY;       
        NextCycleAction:=   1;
    END_IF;

END_FUNCTION
//
//FUNCTION Num_Slaves_Class_ENTER
	//Compare();
    //RecountEnSlaves:= 1; // уходит в стратегию и обрабатывается там. Сбрасывается тоже в стратегии.
//END_FUNCTION

FUNCTION DummyService                   // Function for Service masks, allow you to enter 
    IF (PwdTyp >= 2) THEN    // only if logged as service or manufacturer
        GotoNextField();
    ELSE
        ShowPopUpMessage(4, POPUP_TIME);//  Введите Сервисный пароль для изменения Сервисных настроек
    END_IF;
END_FUNCTION

FUNCTION SetTimeZoneRu // подмена функции SetTimeZone. Только для русифицированного пользовательского интерфейса
    Compare();
    IF SetTimezoneTmp = 1 THEN
        (*переводим временнЫе зоны РФ в кареловскую таблицу *)
        IF      (TimeZoneTmpRu = 0)   THEN    TimeZoneTmp:=34;
        ELSIF   (TimeZoneTmpRu = 1)   THEN    TimeZoneTmp:=49;
        ELSIF   (TimeZoneTmpRu = 2)   THEN    TimeZoneTmp:=55; //  Москва
        ELSIF   (TimeZoneTmpRu = 3)   THEN    TimeZoneTmp:=57;
        ELSIF   (TimeZoneTmpRu = 4)   THEN    TimeZoneTmp:=66;
        ELSIF   (TimeZoneTmpRu = 5)   THEN    TimeZoneTmp:=64;
        ELSIF   (TimeZoneTmpRu = 6)   THEN    TimeZoneTmp:=71;
        ELSIF   (TimeZoneTmpRu = 7)   THEN    TimeZoneTmp:=76;
        ELSIF   (TimeZoneTmpRu = 8)   THEN    TimeZoneTmp:=84;
        ELSIF   (TimeZoneTmpRu = 9)   THEN    TimeZoneTmp:=86;
        ELSIF   (TimeZoneTmpRu = 10)  THEN    TimeZoneTmp:=90;
        ELSIF   (TimeZoneTmpRu = 11)  THEN    TimeZoneTmp:=91;
        END_IF;

        GeneralMng.Zone_Write := TimeZoneTmp;
        GeneralMng.SetTimezone := TRUE;
        GeneralMng.ReadTimezone := TRUE;
        SetTimezoneTmp := 0;
    END_IF;
    GotoNextField();
END_FUNCTION

FUNCTION SetTimeZone
    Compare();
    IF SetTimezoneTmp = 1 THEN
        GeneralMng.Zone_Write := TimeZoneTmp;
        GeneralMng.SetTimezone := TRUE;
        GeneralMng.ReadTimezone := TRUE;
        SetTimezoneTmp := 0;
    END_IF;
    GotoNextField();
END_FUNCTION

FUNCTION TZUp
    Increment_WORD();    
    Compare();
END_FUNCTION

FUNCTION TZDwn
    Decrement_WORD();
    Compare();
END_FUNCTION

FUNCTION Date_PRG_button // выход из режима редактирования даты/времени с изменениями

    IF (StatePRG = STATE_PRG_READY) THEN 

        IF (is_TOP) AND (FLR_Disc_CTRL.Active) THEN
            ShowPopUpMessage(8, POPUP_TIME);//  Нет связи со шкафом управления!
        ELSIF (IsDLE)AND(Role_Slave) THEN// для ведомых
            ShowPopUpMessage(10, POPUP_TIME);//  Только для Ведущего
        ELSE
            StoreMask();
            StatePRG:= STATE_PRG_ON;     
            NextCycleAction:=   1;
            GeneralMng.SecondIn  := GeneralMng.Second;    // Copy the current values of date and time that will be modified
            GeneralMng.MinuteIn  := GeneralMng.Minute;
            GeneralMng.HourIn    := GeneralMng.Hour;
            GeneralMng.DayIn     := GeneralMng.Day;
            GeneralMng.MonthIn   := GeneralMng.Month;
            GeneralMng.YearIn    := GeneralMng.Year;
           
            TimeZoneTmp := GeneralMng.Zone_Read; // aligns "new time zone" to "current"
        END_IF;     
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        EnDateChg();   
        StatePRG:= STATE_PRG_READY;     
        NextCycleAction:=   1;        
    END_IF;

END_FUNCTION

FUNCTION EnDateChg   // Enable for date/hour change
    GeneralMng.En_Date := TRUE;            
    Compare();
    // GotoNextField();
    // 080618 Синхронизация времени контроллеров
    TimeChangedLocal:= TRUE; (*040718*)
    En_TimeSync:= TRUE;    
END_FUNCTION

FUNCTION SlaveSet_ESC
    CurSlaveShow:=  FALSE;
    IF (GetAlarmsCount() > 0) THEN 
        SetLedStatus(12,1);// возвращаем управление колокольчиком основной программе 
    ELSE 
        SetLedStatus(12,0);
    END_IF;
    //RetGroupMask();
    GlobalEsc();
END_FUNCTION

FUNCTION SlaveSet_PRG
(*    IF (StatePRG = STATE_PRG_READY) THEN 
        StatePRG = STATE_PRG_ON;
        GotoNextField();
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        StatePRG:= STATE_PRG_READY;
        GotoCursor(0,10);
    END_IF;
*)
    IF (StatePRG = STATE_PRG_READY) THEN 
        StoreMask();
        StatePRG:= STATE_PRG_ON;     
        NextCycleAction:=   1;        
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        Compare(); 
        (* Перенесено в стратегию, т.к. маски не умеют обрабатывать массивы структур *)
        ApplyCurSettings:= TRUE;
        (*
        IF (__SYSVA_CURSOR_ROW = 3) THEN SlaveMode[CurSlave]:= CurMode;       
	    ELSIF (__SYSVA_CURSOR_ROW = 5) THEN SlaveOnOff[CurSlave]:=	CurOnOff;
        ELSIF (__SYSVA_CURSOR_ROW = 6) THEN SlaveSP[CurSlave]:= CurSP;
        END_IF;       
        *)
        StatePRG:= STATE_PRG_READY;    
        NextCycleAction:=   1;        
    END_IF;

    
END_FUNCTION

FUNCTION SlaveSet_UP
    
    IF (StatePRG = STATE_PRG_OFF)OR(StatePRG = STATE_PRG_READY) THEN 
        IF (CurSlaveShow)THEN
            IF (CurSlave>1) THEN 
                CurSlave:= CurSlave - 1;
            ELSE 
                CurSlave:= Num_Slaves;
            END_IF;      
        END_IF;
(*    ELSIF (StatePRG = STATE_PRG_ON) THEN  
        IF (__SYSVA_CURSOR_ROW=10)AND(__SYSVA_CURSOR_COLUMN=0) THEN GotoNextField(); Swap();
        ELSIF (__SYSVA_CURSOR_ROW=3) THEN Swap();
        ELSIF (__SYSVA_CURSOR_ROW=5) THEN Swap();
        ELSIF (__SYSVA_CURSOR_ROW=6) THEN Increment_REAL_1();
        END_IF;
*)
    END_IF;

END_FUNCTION

FUNCTION SlaveSet_ALARM

    StoreMask();
    StatePRG:=  4;
    IF (CurState = 8) THEN   
        ShowPopUpMessage(3, POPUP_TIME);//  Ведомый не в сети!
    ELSE
        IF (WORDs_SlaveAlarms[CurSlave] = 0) THEN // если нет аварий, переходим на маску "Нет аварий"
            GotoMask(Slave_NoAlrms);
        ELSE
            Slave_AlrmIdx:=1;
            CurSlaveAlarmShow:= TRUE;// сообщаем стратегии что сейчас будем показывать аварии текущего ведомого        
	        GotoLoop(SLAVEALARMS); (*переходим в петлю аварий ведомых устройств*)
        END_IF;
    END_IF;

END_FUNCTION

FUNCTION SlaveSet_DOWN
    
    IF (StatePRG = STATE_PRG_OFF)OR(StatePRG = STATE_PRG_READY) THEN 
        IF (CurSlaveShow)THEN
            IF (CurSlave < Num_Slaves) THEN 
                CurSlave:= CurSlave + 1;
            ELSE 
                CurSlave:= 1; 
            END_IF;       
        END_IF;
(*    ELSIF (StatePRG = STATE_PRG_ON) THEN  
        IF (__SYSVA_CURSOR_ROW=10)AND(__SYSVA_CURSOR_COLUMN=0) THEN GotoNextField(); Swap();
        ELSIF (__SYSVA_CURSOR_ROW=3) THEN Swap();
        ELSIF (__SYSVA_CURSOR_ROW=5) THEN Swap();
        ELSIF (__SYSVA_CURSOR_ROW=6) THEN Decrement_REAL_1();
        END_IF;
*)
    END_IF;

END_FUNCTION

FUNCTION ChgPwd           // Function for password change
    Compare();
    IncrTmp := IncrTmp + 1;
    
    IF IncrTmp >= 4 THEN
        GotoNextField();
        IncrTmp := 0;
        GeneralMng.WritePwd := 1;
    ELSE 
        GotoRightDigit();
    END_IF;
END_FUNCTION

FUNCTION SetUoMZone_UI
    Compare();
    SetUoMZone (STD_UOM_ZONE_UI);
    GotoNextField ();
END_FUNCTION

FUNCTION ENTER_button
    IF (StatePRG = STATE_PRG_ON) THEN
        Compare(); 
        GotoNextField();
    END_IF;
END_FUNCTION

FUNCTION DeleteAlarmLog
    // Alarm logs clear
    IF AlrmLogDelete = TRUE THEN           
        ClearAlarmLogs();
        DTPopUp:= POPUP_TIME;// запускаем таймер всплывающего окна
        StoreMask();
        GotoMask(AlrmLog_Cleared);
        AlrmLogDelete := FALSE;
    END_IF;
    Gotonextfield();
END_FUNCTION

FUNCTION ClearAutoResetCounter

    // Alarm counters clear
    IF ClrAutoResCounters = TRUE THEN  
        ClearAutoResetCounters();
        ClrAutoResCounters := FALSE;
        GlobalEsc();
    ELSE
        Gotonextfield();
    END_IF;

END_FUNCTION

FUNCTION WipeMem
    // Enable wipe retain memory
    IF En_WipeRetain THEN
        GeneralMng.WipeMem[1] := 1;
        En_WipeMem := TRUE;
    END_IF;
    // Enable wipe NVRAM memory
    IF En_WipeNVRAM THEN
        GeneralMng.WipeMem[1] := 2;
        En_WipeMem := TRUE;
    END_IF;    
    // Enable wipe retain+NVRAM memory
    IF En_WipeAll THEN
        GeneralMng.WipeMem[1] := 3;
        En_WipeMem := TRUE;
    END_IF;
    GotoNextField();
END_FUNCTION

FUNCTION ParamImpExp   // Selection of import/export paramenters function
    Compare();
    IF UnitOn AND EnImpExpTmp = 1 THEN
        SetLedStatus(7,2);
        StoreMask();
        DTPopUp:=   POPUP_TIME;// запускаем таймер всплывающего окна
        Gotomask(ParamsImpExpErr);
        //MaskPos:= MASK_POS_MENU;
        EnImpExpTmp := 0;
    ELSIF EnImpExpTmp = 1 AND ImpExpSel = 0 THEN
        ImpExpMng.En_ParamsImp := 1;
        StoreMask();
        DTPopUp:=   POPUP_TIME;// запускаем таймер всплывающего окна
        Gotomask(ParamsImpExpRes);
        EnImpExpTmp := 0;
    ELSIF EnImpExpTmp = 1 AND ImpExpSel = 1 THEN
        ImpExpMng.En_ParamsExp := 1;
        StoreMask();
        DTPopUp:=   POPUP_TIME;// запускаем таймер всплывающего окна
        Gotomask(ParamsImpExpRes);
        EnImpExpTmp := 0;
    ELSE
        GotoNextField();
    END_IF;   
END_FUNCTION

FUNCTION AlrmExp   
    Compare();
    IF EnAlrmExpTmp = 1 THEN
        GeneralMng.En_AlrmExp := TRUE;
        Gotomask(AlrmExpRes);
        EnAlrmExpTmp := 0;
    ELSE
        GotoNextField();
    END_IF;
END_FUNCTION

FUNCTION Sched_UP
	IF (StatePRG = STATE_PRG_OFF)OR(StatePRG = STATE_PRG_READY) THEN
        IF (CurDayOfWeek > 1) THEN CurDayOfWeek:= CurDayOfWeek - 1;
        ELSE CurDayOfWeek:= 7;
        END_IF;  
    END_IF;
END_FUNCTION

FUNCTION Sched_DOWN
	IF (StatePRG = STATE_PRG_OFF)OR(StatePRG = STATE_PRG_READY) THEN 
        IF (CurDayOfWeek < 7) THEN CurDayOfWeek:= CurDayOfWeek + 1;
        ELSE CurDayOfWeek:= 1;    
        END_IF;   
    END_IF;
END_FUNCTION

FUNCTION Sched_ENTER   // Enable for date/hour change
    Compare();
    MaskMng.Chg_Sched :=    TRUE;       
    MaskMng.Sched_ROW:=     __SYSVA_CURSOR_ROW;
    MaskMng.Sched_COLUMN:=  __SYSVA_CURSOR_COLUMN;
    GotoNextField();
END_FUNCTION

FUNCTION Sched_PRG

    IF (StatePRG = STATE_PRG_READY) THEN
        MaskMng.getData:=   TRUE;
        StoreMask();
        StatePRG:=          STATE_PRG_ON;     
        NextCycleAction:=   1;        
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        Compare();             
        StatePRG:=              STATE_PRG_READY; 
        MaskMng.setChanges:=    TRUE;
        NextCycleAction:=       1;        
    END_IF;

END_FUNCTION

FUNCTION Schedule_1_ESC
    IF (StatePRG = STATE_PRG_READY) THEN 
        GlobalEsc();
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        Compare(); 
	    ShowPopUpQuestion(25, TRUE); //Сохранить изменения?
    END_IF;
END_FUNCTION

(*				END IMPORT CODE					*)



// Heater_2
FUNCTION Dep_REAL_1_UP
	__TMP_REAL := __TMP_REAL + TO_REAL(__SYSVA_KEY_COUNTER) / 10.0;
    IF (__SYSVA_CURSOR_ROW = 4) THEN 
        IF (__TMP_REAL > Par_Ws08) THEN 
            __TMP_REAL:= Par_Ws08;
        END_IF;
    ELSIF (__SYSVA_CURSOR_ROW = 6) THEN 
        IF (__TMP_REAL > Par_Ws07) THEN 
            __TMP_REAL:= Par_Ws07;
        END_IF;
    ELSE
        CheckLimitsDecr();
    END_IF;
END_FUNCTION

FUNCTION Dep_REAL_1_DOWN
	__TMP_REAL := __TMP_REAL - TO_REAL(__SYSVA_KEY_COUNTER) / 10.0;
    IF (__SYSVA_CURSOR_ROW = 5) THEN 
        IF (__TMP_REAL < Par_Ws08) THEN 
            __TMP_REAL:= Par_Ws08;
        END_IF;
    ELSIF (__SYSVA_CURSOR_ROW = 6) THEN 
        IF (__TMP_REAL < Par_Ws06) THEN 
            __TMP_REAL:= Par_Ws06;
        END_IF;
    ELSE
        CheckLimitsDecr();
    END_IF;
END_FUNCTION

FUNCTION Dep_REAL_1_ENTER
    IF (__SYSVA_CURSOR_ROW = 6) THEN 
        IF (__TMP_REAL > 7.0) THEN 
            Par_Ws06:= 5.0;
        ELSE
            Par_Ws06:= Par_Ws07;  
        END_IF;
    END_IF;
	Compare();
    GotoNextField();
END_FUNCTION


FUNCTION Alrms_Log_ENTER
	AlrmLogCode:=AlrmLogCode+1;
END_FUNCTION


//FUNCTION Hide_UnitModel_Class_ENTER
	//IF (TO_USINT(__TMP_BYTE) = UnitModel) THEN
        //GotoNextField ();
    //ELSE        
        //UnitModel:= TO_USINT(__TMP_BYTE);
        //CASE UnitModel OF
            //1,2,3,4,5,6: SUM_Comp:= 1;
            //7,8,9:       SUM_Comp:= 2;
        //END_CASE;        
    //END_IF;
    //
//END_FUNCTION
//
//FUNCTION UnitModel_Class_ENTER
	 //UnitModel:= TO_USINT(__TMP_BYTE);
    //CASE UnitModel OF
        //1,2,3,4,5,6: SUM_Comp:= 1;
        //7,8,9:       SUM_Comp:= 2;
    //END_CASE;   
//END_FUNCTION

//FUNCTION POOLConfig_PRG
//
    //IF (StatePRG = STATE_PRG_READY) THEN 
        //StoreMask();
        //StatePRG:= STATE_PRG_ON;     
    //ELSIF (StatePRG = STATE_PRG_ON) THEN 
        //Compare();
//
        //IF (temp_HeatType <> HeatType) THEN
            //IF (temp_HeatType = 1) OR (HeatType = 1)  THEN
                //(*Reboot_Reason:= 2;// изменение типа нагрева
                //StoreMask();
                //GotoMask(NeedReboot);*)
                //ShowPopUpQuestion(3);// изменение типа нагрева
            //END_IF;
        //END_IF;       
//
        //CASE UnitModel OF
            //1,2,3,4,5,6: SUM_Comp:= 1;
            //7,8,9:       SUM_Comp:= 2;
        //END_CASE;   
        //StatePRG:= STATE_PRG_READY;    
    //END_IF;
    //NextCycleAction:=   1;        
//END_FUNCTION

//FUNCTION POOLConfig_2_PRG
//
    //IF (StatePRG = STATE_PRG_READY) THEN 
        //StoreMask();
        //StatePRG:= STATE_PRG_ON;   
        //NextCycleAction:=   1;        
    //ELSIF (StatePRG = STATE_PRG_ON) THEN 
        //Compare();
//
        //IF (temp_HeatType <> HeatType) THEN
            //IF (temp_HeatType = 1) OR (HeatType = 1)  THEN
                //(*Reboot_Reason:= 2;// изменение типа нагрева
                //StoreMask();
                //GotoMask(NeedReboot)*)
                //ShowPopUpQuestion(3);// изменение типа нагрева
            //ELSE
                //HeatType:= temp_HeatType;
//
                //NextCycleAction:=   1;        
                //StatePRG:= STATE_PRG_READY;
            //END_IF;
        //ELSE            
            //NextCycleAction:=   1;        
            //StatePRG:= STATE_PRG_READY;  
        //END_IF;    
    //END_IF;
     //
//END_FUNCTION

//FUNCTION TOPConfig_PRG
//
    //IF (StatePRG = STATE_PRG_READY) THEN 
        //StoreMask();
        //StatePRG:= STATE_PRG_ON;     
    //ELSIF (StatePRG = STATE_PRG_ON) THEN 
        //Compare();      
        //StatePRG:= STATE_PRG_READY;    
    //END_IF;
    //NextCycleAction:=   1;        
//END_FUNCTION

FUNCTION Upgrade_1_ENTER
	// Upgrade.En_Read:= TRUE;
    Upgrade.Check_Upgrade:= TRUE;
END_FUNCTION

FUNCTION Upgrade_1_PRG
    IF (Upgrade.En_FirmWare) THEN
        Upgrade.En_Upgrade:= TRUE;
        GotoMask(Upgrade_Progress);
    ELSE
        Upgrade_1_ENTER();
    END_IF;
END_FUNCTION

(*				BEGIN IMPORT CODE				*)

FUNCTION NetMap_ENTER

    CurSlave:=      CurPosition;
    CurSlaveShow:=  TRUE;   // сообщаем стратегии что сейчас будем показывать текущего ведомого

	GotoMaskID(32); //SlaveState
    
END_FUNCTION

FUNCTION SlaveState_ESC
    CurSlaveShow:=  FALSE;// сообщаем стратегии что прекращаем показывать текущего ведомого
    IF (GetAlarmsCount() > 0) THEN
        SetLedStatus(12,1);// возвращаем управление колокольчиком основной программе 
    ELSE 
        SetLedStatus(12,0);
    END_IF;
    GotoMask(NetMap);
END_FUNCTION

FUNCTION Incr_REAL_x1000 
    __TMP_REAL := __TMP_REAL + TO_REAL(__SYSVA_KEY_COUNTER)*1000.0;
    CheckLimitsDecr();
END_FUNCTION

FUNCTION Decr_REAL_x1000 
    __TMP_REAL := __TMP_REAL - TO_REAL(__SYSVA_KEY_COUNTER)*1000.0;
    CheckLimitsDecr();
END_FUNCTION

(*				END IMPORT CODE					*)


FUNCTION DeviceRole_Class_PRG
    IF (StatePRG = STATE_PRG_READY) THEN
        StoreMask();
        StatePRG:= STATE_PRG_ON;    
        NextCycleAction:= 2;        
    ELSIF (StatePRG = STATE_PRG_ON) THEN
        Compare();
        IF (temp_Role <> Role) THEN
            IF (temp_Role = 0)OR(Role_Master) THEN
                (*Reboot_Reason:= 3;// изменение роли устройства
                StoreMask();
                GotoMask(NeedReboot);*)
                ShowPopUpQuestion(4); // изменение роли устройства
            ELSE
                Role:=      temp_Role;  
                StoreMask();
                StatePRG:= STATE_PRG_READY;     
                NextCycleAction:=   1;        
            END_IF;
        ELSE
            StoreMask();
            StatePRG:= STATE_PRG_READY;    
            NextCycleAction:=   1;        
        END_IF; 
    END_IF;
END_FUNCTION

FUNCTION DeviceRole_Class_ENTER
    IF (StatePRG <> STATE_PRG_READY) THEN
	    Compare();
        IF (temp_Role <> Role) THEN
            IF (temp_Role = 0)OR(Role_Master) THEN                
                ShowPopUpQuestion(4);// изменение роли устройства
            ELSE
                Role:=  temp_Role;  
            END_IF;
        END_IF;     
    END_IF;
END_FUNCTION

FUNCTION HeatType_ENTER
	Compare ();
    IF (temp_HeatType <> HeatType) THEN
        IF (temp_HeatType = 1) OR (HeatType = 1)  THEN         
            ShowPopUpQuestion(3);// изменение типа нагрева
        ELSE
            HeatType:= temp_HeatType;
        END_IF;
    END_IF;
END_FUNCTION


// Тест. Управление частотником
FUNCTION Main_Testing_ESC
    IF (EnPwdChgM) THEN
	    En_Testing:= TRUE;
        GotoLoop(TESTING);
        StatePRG:= STATE_PRG_READY;
    END_IF;
END_FUNCTION

FUNCTION Testing_ESC
    En_Testing:= FALSE;
	GotoMain();
    StatePRG:= STATE_PRG_OFF;
END_FUNCTION

// ModBus
FUNCTION Show_ports 
    IF (Temp_MB_port = 0) THEN
        En_MB_Ethernet:= FALSE;
        En_MB_BMS_Card:= FALSE;
        En_MB_BMS2:= FALSE;
        En_MB_BMS:= FALSE;   
    ELSIF (Temp_MB_port = 1) THEN
        En_MB_Ethernet:= TRUE;
        En_MB_BMS_Card:= FALSE;
        En_MB_BMS2:= FALSE;  
        En_MB_BMS:= FALSE;      
    ELSIF (Temp_MB_port = 2) THEN
        En_MB_Ethernet:= FALSE;
        En_MB_BMS_Card:= TRUE;
        En_MB_BMS2:= FALSE;
        En_MB_BMS:= TRUE;
        Temp_MB_Baudrate:= BMS_Card.Baudrate;
        Temp_MB_StopBits:= BMS_Card.StopBits;
        Temp_MB_Parity:= BMS_Card.Parity;       
    ELSIF (Temp_MB_port = 3) THEN
        En_MB_Ethernet:= FALSE;
        En_MB_BMS_Card:= FALSE;
        En_MB_BMS2:= TRUE;
        En_MB_BMS:= TRUE;
        Temp_MB_Baudrate:= BMS2.Baudrate;
        Temp_MB_StopBits:= BMS2.StopBits;
        Temp_MB_Parity:= BMS2.Parity;        
    END_IF;    
END_FUNCTION

FUNCTION Port_Sel_ENTER    
    IF (Temp_MB_port <> TO_USINT(__TMP_BYTE)) THEN
        Compare();
	    Show_ports();
    ELSE
        GotoNextField();
    END_IF;    
END_FUNCTION

FUNCTION MB_Settings_1_PRG
    IF (StatePRG = STATE_PRG_READY) THEN 
        StoreMask();
        StatePRG:= STATE_PRG_ON;    
        NextCycleAction:=   1;        
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        Compare(); 
        IF (Temp_MB_port <> MB_port) 
            OR (Temp_MB_Address <> MB_Address) 
            OR ((Temp_MB_port = 2)AND (Temp_MB_Baudrate <> BMS_Card.Baudrate))
            OR ((Temp_MB_port = 2)AND (Temp_MB_StopBits <> BMS_Card.StopBits))
            OR ((Temp_MB_port = 2)AND (Temp_MB_Parity <> BMS_Card.Parity))
            OR ((Temp_MB_port = 3)AND (Temp_MB_Baudrate <> BMS2.Baudrate))
            OR ((Temp_MB_port = 3)AND (Temp_MB_StopBits <> BMS2.StopBits))
            OR ((Temp_MB_port = 3)AND (Temp_MB_Parity <> BMS2.Parity))
            THEN           
            (*Reboot_Reason:= 4;// изменение настроек ModBus
            StoreMask();
            GotoMask(NeedReboot);*)
            ShowPopUpQuestion(5);// изменение настроек ModBus
        ELSE
            Show_ports();
            StatePRG:= STATE_PRG_READY;   
            NextCycleAction:=   1;        
        END_IF;               
    END_IF;
END_FUNCTION

FUNCTION MB_Settings_1_ESC
    IF (StatePRG = STATE_PRG_READY) THEN 
        GlobalEsc();
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        Compare(); 
        IF (Temp_MB_port <> MB_port) 
            OR (Temp_MB_Address <> MB_Address) 
            OR ((Temp_MB_port = 2)AND (Temp_MB_Baudrate <> BMS_Card.Baudrate))
            OR ((Temp_MB_port = 2)AND (Temp_MB_StopBits <> BMS_Card.StopBits))
            OR ((Temp_MB_port = 2)AND (Temp_MB_Parity <> BMS_Card.Parity))
            OR ((Temp_MB_port = 3)AND (Temp_MB_Baudrate <> BMS2.Baudrate))
            OR ((Temp_MB_port = 3)AND (Temp_MB_StopBits <> BMS2.StopBits))
            OR ((Temp_MB_port = 3)AND (Temp_MB_Parity <> BMS2.Parity))
            THEN           
            (*Reboot_Reason:= 4;// изменение настроек ModBus
            StoreMask();
            GotoMask(NeedReboot);*)
            ShowPopUpQuestion(5);// изменение настроек ModBus
        ELSE
            GlobalEsc();
        END_IF;               
    END_IF;
END_FUNCTION

FUNCTION Mul_DWORD_x2
    __TMP_DWORD := __TMP_DWORD * 2;
    CheckLimitsIncr();
END_FUNCTION

FUNCTION Div_DWORD_x2
    __TMP_DWORD := __TMP_DWORD / 2;
    CheckLimitsDecr();
END_FUNCTION
FUNCTION Upgrade_OS_ESC
	Upgrade.REQ_OS_upgrade:= FALSE;
    GotoLoop(UPGRADE);
END_FUNCTION

FUNCTION Upgrade_OS_PRG
	Upgrade.ANSW_OS_upgrade:= TRUE;
    GotoMask(Upgrade_Progress);
END_FUNCTION

FUNCTION PRG_button_goto10
	 IF (StatePRG = STATE_PRG_READY) THEN 
        StoreMask();
        StatePRG:= STATE_PRG_ON;   
        NextCycleAction:=   2;  
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        Compare();
        StatePRG:= STATE_PRG_READY;    
        NextCycleAction:=   1; 
    END_IF;          
END_FUNCTION

// Переход на следующую маску в режиме программирования
FUNCTION DOWN_ENTER_Move 
    IF (StatePRG = STATE_PRG_ON) THEN
        GotoNextMask();
        checkZeroColumn:= TRUE;
    END_IF;
END_FUNCTION

// Переход на предыдущую маску в режиме программирования
FUNCTION UP_ENTER_Move     
    IF (StatePRG = STATE_PRG_ON) THEN
        GotoPreviousMask();
        checkZeroColumn:= TRUE;   
    END_IF;
END_FUNCTION

FUNCTION Decrement // уменьшение байтовой переменной с индикацией стрелки
    Decrement_BYTE(); 
    downArrow:= TRUE;
END_FUNCTION

FUNCTION Increment  // увеличение байтовой переменной с индикацией стрелки	
    Increment_BYTE();
    upArrow:=   TRUE;
END_FUNCTION

FUNCTION BoolDown   // уменьшение булевой переменной с индикацией стрелки
	BoolSwap();
    downArrow:= TRUE;
END_FUNCTION

FUNCTION BoolUp     // увеличение булевой переменной с индикацией стрелки
	BoolSwap();
    upArrow:=   TRUE;
END_FUNCTION

//FUNCTION FConfigSetBool  // принятие булевой переменной с индикацией выбора
    //MakeChoice:=        TRUE;
    //NextCycleAction:=   3;      
//END_FUNCTION
//
//FUNCTION FConfigSetByte  // принятие байтовой переменной с индикацией выбора
    //Compare();
    //MakeChoice:=        TRUE;
    //NextCycleAction:=   3;      
//END_FUNCTION
//
//FUNCTION FConfigSetPriority  // принятие  переменной ModeSEQ c переходом к петле CONFIRM_CONFIG
    //Compare();
    //NextCycleAction:=   6;      
//END_FUNCTION
//
//
//FUNCTION FConfig_LastMask    // принятие последней в петле байтовой переменной с индикацией выбора
	//Compare();
    //MakeChoice:=        TRUE;  
    //IF (IsPOOL) THEN
        //NextCycleAction:=   6;
    //ELSE
        //NextCycleAction:=   5;
    //END_IF;
//END_FUNCTION
//
//FUNCTION FConfig_ESC  // запрос на возврат к началу первой конфигурации
    //IF (CompletePreConfig) THEN
        //ShowPopUpQuestion(12);  // Выйти из мастера конфигураций
    //ELSE
        //StatePRG:= STATE_PRG_ALWAYS_ON;
        //MakeChoice:=    FALSE;
        //ShowPopUpQuestion(7);   // Вернуться к началу конфигурации?
    //END_IF;
//END_FUNCTION

FUNCTION SWAP_Sp100
    BoolSwap();
    IF (wCoil_Mode_A_B)AND(Par_Sp100) THEN
        ShowPopUpMessage(12, SHORT_POPUP_TIME);
        //Par_Sp100:=   FALSE;
    END_IF;
END_FUNCTION

FUNCTION SWAP_Tp10 // Проверка при переключении параметра Tp10 в меню
    BoolSwap();
    IF NOT(SNSR_Thru.Use)OR(SNSR_Thru.Error <> 10) THEN
		IF NOT(Par_Tp10)THEN
            ShowPopUpMessage(11, SHORT_POPUP_TIME);
            Par_Tp10:=   TRUE;
        END_IF;
    END_IF;
END_FUNCTION


FUNCTION ManualManager // Вход и выход из ручного режима
    VAR_INPUT
        in : BOOL;
    END_VAR

    IF (in)AND NOT(ManualManage)THEN
        ManualManage:=  TRUE;
        ShowPopUpMessage(15, SHORT_POPUP_TIME); //  Ручной режим включен
    ELSIF NOT(in)AND (ManualManage)THEN
        ManualManage:=  FALSE;
        CurRow:= 0;
        ShowPopUpMessage(16, SHORT_POPUP_TIME); // Ручной режим выключен
    END_IF;

END_FUNCTION

FUNCTION Param_UP   // Переход вверх

    IF (StatePRG = STATE_PRG_READY) THEN
        IF (CurRow > 1) THEN
            CurRow:= CurRow - 1;
        ELSE
           
            //MaskMng.shift_position:= -(TO_DINT(__SYSVA_KEY_COUNTER)/20) - 1;
            Position:= Position - TO_DINT(__SYSVA_KEY_COUNTER)/20 - 1;

            //IF (Position + MaskMng.shift_position < 1) THEN  
                //__SYSVA_KEY_COUNTER:= 0;
                //CurRow:= num_Rows;
                //Beep();
            //END_IF;
            IF (Position < 1) THEN     
                __SYSVA_KEY_COUNTER:= 0;
                Position:= cnt_Items - num_Rows + 1;
                CurRow:= num_Rows;
                //Beep();
            END_IF;            
        END_IF;
        CurList_Position:= Position + CurRow - 1;
        Display.Hint:= Display.Descr[CurRow];
        update_ParamMenu_List:=      TRUE;   
    ELSIF (StatePRG = STATE_PRG_ON) THEN
        
        CASE (Display.value_Storage[CurRow_modePRG]) OF
            0: // BOOL
                IF (Display.value_BOOL[CurRow_modePRG] = 2) THEN
                    Display.value_BOOL[CurRow_modePRG]:= 1;
                END_IF;
            1: // UINT
                Display.value_INT[CurRow_modePRG]:=  Display.value_INT[CurRow_modePRG] + TO_INT(__SYSVA_KEY_COUNTER);
            2: // REAL
                Display.value_REAL[CurRow_modePRG]:=  Display.value_REAL[CurRow_modePRG] + TO_REAL(__SYSVA_KEY_COUNTER)/10.0;
        END_CASE;
        CheckValueBorders ();
    END_IF;    
    NextCycleAction:= 12; //Обновление подсказки и позиции
END_FUNCTION

FUNCTION Param_DOWN   // Переход вверх
  
    IF (StatePRG = STATE_PRG_READY) THEN 
        IF (CurRow < num_Rows) THEN
            CurRow:= CurRow + 1;
        ELSE
            Position:= Position + TO_DINT(__SYSVA_KEY_COUNTER)/20 + 1;
            
            IF (Position > cnt_Items - num_Rows + 1) THEN     
                __SYSVA_KEY_COUNTER:= 0;
                Position:= 1;
                CurRow:= 1;
                //Beep();
            END_IF;
           //MaskMng.shift_position:= TO_DINT(__SYSVA_KEY_COUNTER)/20 + 1;
            //
            //IF (Position + MaskMng.shift_position > cnt_Items - num_Rows + 1) THEN     
                //__SYSVA_KEY_COUNTER:= 0;
                //CurRow:= 1;
                //Beep();
            //END_IF;
        END_IF;
        CurList_Position:= Position + CurRow - 1;
        Display.Hint:= Display.Descr[CurRow];
        update_ParamMenu_List:=      TRUE;  
    ELSIF (StatePRG = STATE_PRG_ON) THEN        
        
        CASE (Display.value_Storage[CurRow_modePRG]) OF
            0: // BOOL
                IF (Display.value_BOOL[CurRow_modePRG] = 1) THEN
                    Display.value_BOOL[CurRow_modePRG]:= 2;
                END_IF;
            1: // UINT
                Display.value_INT[CurRow_modePRG]:=  Display.value_INT[CurRow_modePRG] - TO_INT(__SYSVA_KEY_COUNTER);
            2: // REAL
                Display.value_REAL[CurRow_modePRG]:=  Display.value_REAL[CurRow_modePRG] - TO_REAL(__SYSVA_KEY_COUNTER)/10.0;
        END_CASE;
        CheckValueBorders ();
    END_IF;
    NextCycleAction:= 12; //Обновление подсказки и позиции
END_FUNCTION

FUNCTION Param_ENTER   // Подтверждение
    IF (StatePRG = STATE_PRG_ON) THEN

        Write_Parameter();
        
        IF (CurRow_modePRG < num_Rows) THEN
            CurRow_modePRG:= CurRow_modePRG + 1;
        ELSE
            Position:= Position + TO_DINT(__SYSVA_KEY_COUNTER)/20 + 1;
            
            IF (Position > cnt_Items - num_Rows + 1) THEN     
                __SYSVA_KEY_COUNTER:= 0;
                Position:= 1;
                CurRow_modePRG:= 1;
                //Beep();
            END_IF;            
        END_IF;
        //getParamMenu:=      TRUE;  
        CurList_Position:= Position + CurRow_modePRG - 1;
        Display.Hint:= Display.Descr[CurRow_modePRG];
        update_ParamMenu_List:=      TRUE;  
    END_IF;    

    NextCycleAction:= 12; //Обновление подсказки и позиции
END_FUNCTION


FUNCTION Write_Parameter // Запись параметра

    CheckValueBorders ();
    CASE (Display.value_Storage[CurRow_modePRG]) OF
        0: // BOOL
            IF (Display.value_BOOL[CurRow_modePRG] = 1) THEN ;
                param.BOOL[Display.value_Address[CurRow_modePRG]]:= TRUE;
            ELSIF (Display.value_BOOL[CurRow_modePRG] = 2) THEN ;
                param.BOOL[Display.value_Address[CurRow_modePRG]]:= FALSE;
            END_IF;
        1: // INT
            IF (param.INT[Display.value_Address[CurRow_modePRG]] <>
                Display.value_INT[CurRow_modePRG])
            THEN
                //MaskMng.param_ChangeNotify:= Display.Descr[CurRow_modePRG];
                param.INT[Display.value_Address[CurRow_modePRG]]:= Display.value_INT[CurRow_modePRG];
            END_IF;
        2: // REAL
            IF (param.REAL[Display.value_Address[CurRow_modePRG]] <>
                Display.value_REAL[CurRow_modePRG])
            THEN
                //MaskMng.param_ChangeNotify:= Display.Descr[CurRow_modePRG];
                param.REAL[Display.value_Address[CurRow_modePRG]]:= Display.value_REAL[CurRow_modePRG];
            END_IF;
    END_CASE;
    
    MaskMng.param_ChangeNotify:= TO_USINT(Display.Descr[CurRow_modePRG]);
END_FUNCTION

FUNCTION Param_ESC   // Переход вверх

    IF (StatePRG = STATE_PRG_READY) THEN 
        //cnt_Items:=  0;
        Position:=      1;
        autoHideArrowsOff:=     FALSE;
        GlobalEsc();
    ELSIF (StatePRG = STATE_PRG_ON) THEN    
        StatePRG:=  STATE_PRG_READY;  
        CurRow:= CurRow_modePRG;
        CurRow_modePRG:=    0;          
        //getParamMenu:=      TRUE;  
        update_ParamMenu_List:= TRUE;
    END_IF;    

END_FUNCTION

FUNCTION CheckValueBorders   // Проверка границ значений
    
    CASE (Display.value_Storage[CurRow_modePRG]) OF
            0: // BOOL
               ;
            1: // UINT
                IF (Display.value_INT[CurRow_modePRG] < Display.value_MinINT[CurRow_modePRG]) THEN
                    Display.value_INT[CurRow_modePRG]:= Display.value_MaxINT[CurRow_modePRG];
                    Beep();
                ELSIF (Display.value_INT[CurRow_modePRG] > Display.value_MaxINT[CurRow_modePRG]) THEN
                    Display.value_INT[CurRow_modePRG]:= Display.value_MinINT[CurRow_modePRG];
                    Beep();
                END_IF;
            2: // REAL
                IF (Display.value_REAL[CurRow_modePRG] < Display.value_MinREAL[CurRow_modePRG]) THEN
                    Display.value_REAL[CurRow_modePRG]:= Display.value_MaxREAL[CurRow_modePRG];
                    Beep();
                ELSIF (Display.value_REAL[CurRow_modePRG] > Display.value_MaxREAL[CurRow_modePRG]) THEN
                    Display.value_REAL[CurRow_modePRG]:= Display.value_MinREAL[CurRow_modePRG];
                    Beep();
                END_IF;
        END_CASE;
END_FUNCTION

FUNCTION UpdateCurPos
// Отображение расширенного описания текущей позиции
    IF (ModePRG) THEN
        Display.Hint:= Display.Descr[CurRow_modePRG];
        CurList_Position:= Position + CurRow_modePRG - 1;
    ELSE
        Display.Hint:= Display.Descr[CurRow];
        CurList_Position:= Position + CurRow - 1;
    END_IF;
END_FUNCTION

FUNCTION CheckListBorders   // Проверка границ списка
    //VAR
        //lastPixelPosition : USINT; // позиция последнего пикселя
    //END_VAR;
//
    //IF (Position <= 1) THEN
        //upArrow:= FALSE;
    //ELSE
        //upArrow:= TRUE;
    //END_IF;
//
    //IF (Position >= cnt_Items - num_Rows + 1) OR 
       //(cnt_Items < num_Rows)
    //THEN
        //downArrow:= FALSE;
    //ELSE
        //downArrow:= TRUE;
    //END_IF;


    


(*
    IF (Slider_Height = 0) THEN
        Slider_Height:= TO_USINT(48 / cnt_Items);
    END_IF;
    
    lastPixelPosition:= Slider_Height * TO_USINT(Position);
    
    IF (lastPixelPosition <= 8) THEN
        Slider_1:= lastPixelPosition;
    ELSIF (lastPixelPosition <= 16) THEN
        Slider_2:= lastPixelPosition - 8;
        IF (Slider_Height > 8) THEN
             Slider_1:= 16 - (Slider_Height - (16 - lastPixelPosition)) ;
        END_IF;
    END_IF;
*)
END_FUNCTION

FUNCTION Param_PRG   // 

    //StoreMask();

    IF (StatePRG = STATE_PRG_READY) THEN        // вход в режим редактирования
            //150121 2.7.6.0 Запрет для пользователя упразднен, т.к. скрываются все ненужные пункты меню.
            //IF (UnitOn)AND(PwdTyp < 2) THEN         //  Для пользователя изменения во время работы запрещены
            //    ShowPopUpMessage(1, POPUP_TIME);    //  Выключите установку для изменения настроек!
            //ELSE               
                StatePRG:=  STATE_PRG_ON; 
                CurRow_modePRG:= CurRow;
                CurRow:=    0;
                // getParamMenu:=      TRUE;      
                update_ParamMenu_List:= TRUE;
                NextCycleAction:= 12; //Обновление подсказки и позиции              
            //END_IF;

    ELSIF (StatePRG = STATE_PRG_ON) THEN        // выход из режима редактирования

        Write_Parameter();
                     
        StatePRG:=  STATE_PRG_READY;  
        CurRow:= CurRow_modePRG;
        CurRow_modePRG:=    0;          
        //getParamMenu:=      TRUE;  
        update_ParamMenu_List:= TRUE;
        NextCycleAction:= 12; //Обновление подсказки и позиции
    END_IF;
END_FUNCTION


//FUNCTION GoToConfiguration
	////load_Config:= TRUE;
    ////isConfigMenu:= TRUE;
    ////getConfigMenu:= TRUE;
    ////CurRow:=            1;
    ////CurRow_modePRG:=    0;
    ////cnt_Items:= 0;
    ////GotoMask(LoadConfig_Mask);
    //ConfigMng.checkConfigFile:= TRUE;
//END_FUNCTION


FUNCTION ConfigMenu_UP   // Переход вверх
    IF (CurRow > 1) THEN
        CurRow:= CurRow - 1;
    ELSE                       
        Position:= Position - TO_DINT(__SYSVA_KEY_COUNTER)/20 - 1;
            
        IF (Position < 1) THEN     
            __SYSVA_KEY_COUNTER:= 0;
            Position:= cnt_Items - num_Rows + 1;
            CurRow:= num_Rows;
            //Beep();
        END_IF;

        IF (isConfigMenu) THEN
            getConfigMenu:= TRUE;
        ELSE
            getParamMenu:= TRUE;
        END_IF;
    END_IF;
    
    CurList_Position:= Position + CurRow - 1;
    Display.Hint:= Display.Descr[CurRow];    
END_FUNCTION


FUNCTION ConfigMenu_DOWN   // Переход вниз  
    IF (CurRow < num_Rows) THEN
        CurRow:= CurRow + 1;
    ELSE            
        Position:= Position + TO_DINT(__SYSVA_KEY_COUNTER)/20 + 1;
            
        IF (Position > cnt_Items - num_Rows + 1) THEN     
            __SYSVA_KEY_COUNTER:= 0;
            Position:= 1;
            CurRow:= 1;
            //Beep();
        END_IF;

        IF (isConfigMenu) THEN
            getConfigMenu:= TRUE;
        ELSE
            getParamMenu:= TRUE;
        END_IF;
    END_IF;
    
    CurList_Position:= Position + CurRow - 1;
    Display.Hint:= Display.Descr[CurRow];
END_FUNCTION

FUNCTION ConfigMenu_ENTER   // 
    IF (Display.value_BOOL[CurRow] = 4) // каталог
    THEN   
        //IF (CurLevel < 10) THEN 
            //Display.Path.MenuPoint[CurLevel]:= CurMenuPoint;
            //Display.Path.Position[CurLevel]:= Position;
            //Display.Path.Row[CurLevel]:= CurRow;
            //CurLevel:= CurLevel + 1; 
            SaveMenuPos();
            CurMenuPoint:= TO_DINT(Display.Descr[CurRow]);       
            getConfigMenu:= TRUE;
        //END_IF;
        IF (CurLevel < 10) THEN 
            CurRow:=            1;
            Position:=          1;
            CurList_Position:=  1;
        END_IF;
    ELSIF (Display.value_BOOL[CurRow] = 7) // действие?
    THEN
        //Display.Path.MenuPoint[CurLevel]:= CurMenuPoint;
        //Display.Path.Position[CurLevel]:= Position;
        //Display.Path.Row[CurLevel]:= CurRow;
        SaveMenuPos();        
        CurMenuPoint:= TO_DINT(Display.Descr[CurRow]);       
        getConfigMenu:= TRUE;
    ELSE
        Display.Path.MenuPoint[CurLevel]:= CurMenuPoint;
        Display.Path.Position[CurLevel]:= Position;
        Display.Path.Row[CurLevel]:= CurRow;
        CurMenuPoint:= TO_DINT(Display.Descr[CurRow]);       
        setConfigItem:= TRUE;
    END_IF;
    //NextCycleAction:= 12;
    Display.Hint:= Display.Descr[CurRow];
END_FUNCTION      

FUNCTION ConfigMenu_ESC   // 
    IF (CurLevel > ConfigStartLevel) THEN
        LoadMenuPos();
    ELSE
        //Перебрасываем в начало конфигуратора
        Position:=          1;
        CurMenuPoint:=      0;
        CurList_Position:=  1;
        CurRow:=            1;
    
        //IF (CurMenuPoint <> 0) THEN
            //Position:= 1;
            //CurMenuPoint:= 0;
            //CurList_Position:= 1;
            //CurRow:= 1;
        //ELSE 
            //IF (ConfigStartLevel <> 0) THEN
                //IF (IsConfigChanged) THEN
                    ////Сохранить конфигурацию?
                    //ShowPopUpQuestion(21); //InstantAction:=  255; //DF_CFG_END
                //ELSE
                    //GlobalEsc();
                //END_IF;
            //END_IF;
        //END_IF;
    END_IF;     
    
    getConfigMenu:= TRUE;
    //cnt_Items:=  0;

    //NextCycleAction:= 12;
END_FUNCTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          


FUNCTION Signal_DOWN
    
    CASE CurRow OF
        1:
            mask_List_pos:=  mask_List_pos + TO_DINT(__SYSVA_KEY_COUNTER)/20 + 1;
            
            IF (mask_List_pos > cnt_Items) THEN     
                __SYSVA_KEY_COUNTER:= 0;
                mask_List_pos:= 1;
                Beep();
            END_IF;

            Display.Descr[1]:= mask_List[mask_List_pos];
            Display.Hint:= mask_List_Sec[mask_List_pos];
            //Display.Hint:= Display.Descr[1];
            ConfigMng.recount_Types:= TRUE;
            recount_IO:= TRUE;
            getMinMax:= TRUE;
           
        2:
           (*Сдвиг окна позиции*)
			ConfigMng.mask_IO_List_pos:= ConfigMng.mask_IO_List_pos + TO_DINT(__SYSVA_KEY_COUNTER)/20 + 1;		
			(*Проверка выхода за границы*)
			IF (ConfigMng.mask_IO_List_pos > ConfigMng.cnt_IO_Items) THEN     
                __SYSVA_KEY_COUNTER:= 0;
                ConfigMng.mask_IO_List_pos:= 0;
                Beep();
            END_IF;	
			
			Display.Descr[2]:= TO_UINT(ConfigMng.mask_IO_List[ConfigMng.mask_IO_List_pos]);
            //Display.Descr[3]:= TO_USINT(ConfigMng.mask_IO_List_pos);
            //IF (ConfigMng.mask_IO_List_pos = 0) THEN
                //Display.Hint:= 0;
            //ELSE
                //Display.Hint:= ConfigMng.mask_IO_List[0] + 1;
            //END_IF;

        3:
            (*Сдвиг окна позиции*)
			ConfigMng.mask_TypeList_pos:= ConfigMng.mask_TypeList_pos - TO_DINT(__SYSVA_KEY_COUNTER)/20 - 1;		
			(*Проверка выхода за границы*)
			IF (ConfigMng.mask_TypeList_pos < 0) THEN     
                __SYSVA_KEY_COUNTER:= 0;
                ConfigMng.mask_TypeList_pos:= ConfigMng.cnt_TypeItems - 1;
                Beep();
            END_IF;	
			
			Display.Descr[3]:= TO_UINT(ConfigMng.mask_TypeList[ConfigMng.mask_TypeList_pos]);

        4:
            Display.value_REAL[4]:= Display.value_REAL[4] - TO_REAL(__SYSVA_KEY_COUNTER/20) - 1.0;
            IF (Display.value_REAL[4] < Display.value_MinREAL[4]) THEN
                Display.value_REAL[4]:= Display.value_MaxREAL[4];
                Beep();
            END_IF;

        5:
            Display.value_REAL[5]:= Display.value_REAL[5] - TO_REAL(__SYSVA_KEY_COUNTER/20) - 1.0;
            IF (Display.value_REAL[5] < Display.value_MinREAL[5]) THEN
                Display.value_REAL[5]:= Display.value_MaxREAL[5];
                Beep();
            END_IF;
    END_CASE;    
END_FUNCTION

FUNCTION Signal_UP
    
    CASE CurRow OF
        1:
            mask_List_pos:=  mask_List_pos - TO_DINT(__SYSVA_KEY_COUNTER)/20 - 1;
            
            IF (mask_List_pos < 1) THEN     
                __SYSVA_KEY_COUNTER:= 0;
                mask_List_pos:= cnt_Items;
                Beep();
            END_IF;
            //getIOConfig:= TRUE; 

            Display.Descr[1]:= mask_List[mask_List_pos];
            Display.Hint:= mask_List_Sec[mask_List_pos];
            //Display.Descr[2]:= ConfigMng.mask_IO_List[0];
            //Display.Hint:= Display.Descr[1];
            ConfigMng.recount_Types:= TRUE;
            recount_IO:= TRUE;
            getMinMax:= TRUE;
           
        2:
           (*Сдвиг окна позиции*)
			ConfigMng.mask_IO_List_pos:= ConfigMng.mask_IO_List_pos - TO_DINT(__SYSVA_KEY_COUNTER)/20 - 1;		
			(*Проверка выхода за границы*)
			IF (ConfigMng.mask_IO_List_pos < 0) THEN     
                __SYSVA_KEY_COUNTER:= 0;
                ConfigMng.mask_IO_List_pos:= ConfigMng.cnt_IO_Items;
                Beep();
            END_IF;	
			
			Display.Descr[2]:= TO_UINT(ConfigMng.mask_IO_List[ConfigMng.mask_IO_List_pos]);
            //Display.Descr[3]:= TO_USINT(ConfigMng.mask_IO_List_pos);
            //IF (ConfigMng.mask_IO_List_pos = 0) THEN
                //Display.Hint:= 0;
            //ELSE
                //Display.Hint:= ConfigMng.mask_IO_List[0] + 1;
            //END_IF;

        3:
            (*Сдвиг окна позиции*)
			ConfigMng.mask_TypeList_pos:= ConfigMng.mask_TypeList_pos + TO_DINT(__SYSVA_KEY_COUNTER)/20 + 1;		
			(*Проверка выхода за границы*)
			IF (ConfigMng.mask_TypeList_pos > ConfigMng.cnt_TypeItems - 1) THEN     
                __SYSVA_KEY_COUNTER:= 0;
                ConfigMng.mask_TypeList_pos:= 0;
                Beep();
            END_IF;	
			
			Display.Descr[3]:= TO_UINT(ConfigMng.mask_TypeList[ConfigMng.mask_TypeList_pos]);

        4:
            Display.value_REAL[4]:= Display.value_REAL[4] + TO_REAL(__SYSVA_KEY_COUNTER/20) + 1.0;
            IF (Display.value_REAL[4] > Display.value_MaxREAL[4]) THEN
                Display.value_REAL[4]:= Display.value_MinREAL[4];
                Beep();
            END_IF;

        5:
            Display.value_REAL[5]:= Display.value_REAL[5] + TO_REAL(__SYSVA_KEY_COUNTER/20) + 1.0;
            IF (Display.value_REAL[5] > Display.value_MaxREAL[5]) THEN
                Display.value_REAL[5]:= Display.value_MinREAL[5];
                Beep();
            END_IF;
           
    END_CASE;   
END_FUNCTION


FUNCTION Signal_ESC
    
    //RestoreMask();   
    GlobalEsc();

    //CurLevel:= CurLevel - 1;  
    //CurMenuPoint:=  Display.Path.MenuPoint[CurLevel];
    //Position:= Display.Path.Position[CurLevel];
    //CurRow:= Display.Path.Row[CurLevel];
    //Display.Path.MenuPoint[CurLevel]:= 0; 
    //CurList_Position:= Position + CurRow - 1;

    //getConfigMenu:= TRUE;
    
END_FUNCTION

FUNCTION Signal_ENTER
    
    CASE CurRow OF
        1:
            recount_IO:= TRUE;
            //IF (ConfigMng.mask_IO_List_pos = 0) THEN
                //Display.Hint:= 0;
            //ELSE
                //Display.Hint:= ConfigMng.mask_IO_List[0] + 1;
            //END_IF;
            
            IF (num_Rows = 2) THEN
                CurRow:= 2;
            ELSE
                CurRow:= 3;
                Display.Descr[3]:= TO_UINT(ConfigMng.mask_TypeList[ConfigMng.mask_TypeList_pos]);
            END_IF;
        2:            
            ConfigMng.setIoItem:= TRUE;
            //Display.Hint:= 0;            
            CurRow:= 1;
        3:            
            recount_IO:= TRUE;
            CASE Display.Descr[3] OF
                5,6,7,8,9: //AI с min/max
                    CurRow:= 4;                    
            ELSE
                CurRow:= 2;
            END_CASE;
            getMinMax:= TRUE;
        4:
            //сделать запись в переменную Min для сигнала
            ConfigMng.setMinMax:= TRUE;
            CurRow:= 5;
        5:
            //сделать запись в переменную Max для сигнала
            ConfigMng.setMinMax:= TRUE;
            CurRow:= 2;
    END_CASE;

END_FUNCTION

// Управление маской Control_Mode------------
FUNCTION Control_Mode_UP
	upArrow:= TRUE;
    IF (temp_Mode_Control > 1) THEN
        temp_Mode_Control:= temp_Mode_Control - 1;
    ELSE
        temp_Mode_Control:= 10;
    END_IF;

    IF (IsPOOL)(*OR(IsICE)*) THEN
        IF (temp_Mode_Control = 10) THEN
            temp_Mode_Control:= 8;
        ELSIF (temp_Mode_Control = 6) OR (temp_Mode_Control = 5) THEN
            temp_Mode_Control:= 4;
        ELSIF (temp_Mode_Control = 3) THEN
            temp_Mode_Control:= 2;
        END_IF;
    END_IF;
END_FUNCTION

FUNCTION Control_Mode_DOWN
	downArrow:= TRUE;
    IF (temp_Mode_Control < 10) THEN
        temp_Mode_Control:= temp_Mode_Control + 1;
    ELSE
        temp_Mode_Control:= 1;
    END_IF;

    IF (IsPOOL)(*OR(IsICE)*) THEN
        IF (temp_Mode_Control = 3) THEN
            temp_Mode_Control:= 4;
        ELSIF (temp_Mode_Control = 5) OR (temp_Mode_Control = 6) THEN
            temp_Mode_Control:= 7;
        ELSIF (temp_Mode_Control = 9) OR (temp_Mode_Control = 10) THEN
            temp_Mode_Control:= 1;
        END_IF;
    END_IF;
END_FUNCTION

FUNCTION Control_Mode_ENTER
	Mode_Control:= temp_Mode_Control;
END_FUNCTION
//-------------------------------------------


// Управление маской Schedule_Manage------------
FUNCTION Schedule_Manage_UP
	upArrow:= TRUE;
    temp_En_Schedule:= NOT(temp_En_Schedule);
END_FUNCTION

FUNCTION Schedule_Manage_DOWN
	downArrow:= TRUE;
    temp_En_Schedule:= NOT(temp_En_Schedule);
END_FUNCTION

FUNCTION Schedule_Manage_ENTER
	En_Schedule:= temp_En_Schedule;
END_FUNCTION

//-------------------------------------------

//FUNCTION Load_Config
    //load_Config:= TRUE;	
    //GotoMask(LoadConfig_Mask);    
//END_FUNCTION



// Управление масками вх/вых -------------------------------------
FUNCTION IO_DOWN 
    IF (StatePRG = STATE_PRG_ON) THEN
        IF (CurRow = 3) THEN // Надпись Режим
            IF (Display.value_BOOL[1] = 1) THEN //руч.
                CurRow:= 4;
            ELSE
                IF  (Display.MaskID = 11) OR // Дискретные входы
                    (Display.MaskID = 14)    // Аналоговые выходы
                THEN 
                    CurRow:= 5;
                ELSE
                    Beep();
                END_IF;
            END_IF;
        ELSIF (CurRow = 4) THEN // Надпись Статус
            CurRow:= 3;
        ELSIF (CurRow = 5) THEN // Надпись инверсия
            CurRow:= 3;
        ELSIF (CurRow_modePRG = 3) THEN // Изменение режима
            IF (Display.value_BOOL[1] = 0) THEN
                 Display.value_BOOL[1]:= 1;
            ELSIF( Display.value_BOOL[1] = 1) THEN
                Display.value_BOOL[1]:= 0;
            END_IF; 
            //MaskMng.ValueWasChanged:= TRUE;
        ELSIF (CurRow_modePRG = 4) THEN // Изменение значения
            CASE Display.MaskID OF
                11, 13:(*Digital*)
                    Display.value_BOOL[2]:= 2; //OFF
                    MaskMng.ValueWasChanged:= TRUE;
                12:(*Analog inputs*)
                    IF (Display.En_RealValue[1]) THEN
                        Display.value_REAL[1]:= Display.value_REAL[1] - TO_REAL(__SYSVA_KEY_COUNTER)/10.0;
                        IF (Display.value_REAL[1] < Display.value_MinREAL[1]) THEN
                            Display.value_REAL[1]:= Display.value_MaxREAL[1];  
                            __SYSVA_KEY_COUNTER:= 0;       
                            Beep();       
                        END_IF;
                    ELSIF (Display.En_IntValue[1]) THEN
                        Display.value_INT[1]:= Display.value_INT[1] - TO_INT(__SYSVA_KEY_COUNTER)/10 - 1;
                        IF (Display.value_INT[1] < Display.value_MinINT[1]) THEN
                            Display.value_INT[1]:= Display.value_MaxINT[1];  
                            __SYSVA_KEY_COUNTER:= 0;       
                            Beep();       
                        END_IF;
                    END_IF;                
                    //MaskMng.ValueWasChanged:= TRUE;

                14: 
                    Display.value_REAL[1]:= Display.value_REAL[1] - TO_REAL(__SYSVA_KEY_COUNTER)/10.0;
                    IF (Display.value_REAL[1] < 0.0) THEN
                        Display.value_REAL[1]:= 0.0;         
                        Beep();       
                    END_IF;
            END_CASE;
        ELSIF (CurRow_modePRG = 5) THEN // Изменение инверсии
            IF (Display.value_BOOL[3] = 0) THEN
                Display.value_BOOL[3]:= 1;
            ELSE
                Display.value_BOOL[3]:= 0;
            END_IF;
        END_IF;
    ELSE
        mask_List_pos:=  mask_List_pos + TO_DINT(__SYSVA_KEY_COUNTER)/20 + 1;
        IF (mask_List_pos > cnt_Items) THEN     
            __SYSVA_KEY_COUNTER:= 0;
            mask_List_pos:= 1;
            Beep();
        END_IF;
        Display.Descr[1]:= TO_UINT(cfgIO.Link_toCodes[TO_DINT(mask_List[mask_List_pos])]) - TO_UINT(MaskMng.sig_start) + 1;
        Display.Descr[2]:= mask_List[mask_List_pos];
    END_IF;
END_FUNCTION

FUNCTION IO_UP   
    IF (StatePRG = STATE_PRG_ON) THEN
        IF (CurRow = 3) THEN // Надпись Режим
            IF (Display.value_BOOL[1] = 1) THEN //руч.
                CurRow:= 4;
            ELSE
                IF  (Display.MaskID = 11) OR // Дискретные входы
                    (Display.MaskID = 14)    // Аналоговые выходы
                THEN 
                    CurRow:= 5;
                ELSE
                    Beep();
                END_IF;                
            END_IF;
        ELSIF (CurRow = 4) THEN // Надпись Статус            
            CurRow:= 3;
        ELSIF (CurRow = 5) THEN // Надпись инверсия
            CurRow:= 3;
        ELSIF (CurRow_modePRG = 3) THEN // Изменение режима
            IF (Display.value_BOOL[1] = 0) THEN
                 Display.value_BOOL[1]:= 1;
            ELSIF( Display.value_BOOL[1] = 1) THEN
                Display.value_BOOL[1]:= 0;
            END_IF;            
            //MaskMng.ValueWasChanged:= TRUE;
        ELSIF (CurRow_modePRG = 4) THEN // Изменение значения
            CASE Display.MaskID OF
                11, 13:(*Digital*)
                    Display.value_BOOL[2]:= 1; //ON
                    MaskMng.ValueWasChanged:= TRUE;
                12:(*Analog inputs*)
                    IF (Display.En_RealValue[1]) THEN
                        Display.value_REAL[1]:= Display.value_REAL[1] + TO_REAL(__SYSVA_KEY_COUNTER)/10.0;
                        IF (Display.value_REAL[1] > Display.value_MaxREAL[1]) THEN
                            Display.value_REAL[1]:= Display.value_MinREAL[1];  
                            __SYSVA_KEY_COUNTER:= 0;       
                            Beep();       
                        END_IF;
                    ELSIF (Display.En_IntValue[1]) THEN
                        Display.value_INT[1]:= Display.value_INT[1] + TO_INT(__SYSVA_KEY_COUNTER)/10 + 1;
                        IF (Display.value_INT[1] > Display.value_MaxINT[1]) THEN
                            Display.value_INT[1]:= Display.value_MinINT[1];  
                            __SYSVA_KEY_COUNTER:= 0;       
                            Beep();       
                        END_IF;
                    END_IF;               
                    
                14: (*Analog outputs*)
                    Display.value_REAL[1]:= Display.value_REAL[1] + TO_REAL(__SYSVA_KEY_COUNTER)/10.0;
                    IF (Display.value_REAL[1] > 10.0) THEN
                        Display.value_REAL[1]:= 10.0;         
                        Beep();       
                    END_IF;
            END_CASE;
        ELSIF (CurRow_modePRG = 5) THEN // Изменение инверсии
            IF (Display.value_BOOL[3] = 1) THEN
                Display.value_BOOL[3]:= 0;
            ELSE
                Display.value_BOOL[3]:= 1;
            END_IF;
        END_IF;
    ELSE
        mask_List_pos:=  mask_List_pos - TO_DINT(__SYSVA_KEY_COUNTER)/20 - 1;
        IF (mask_List_pos < 1) THEN     
            __SYSVA_KEY_COUNTER:= 0;
            mask_List_pos:= cnt_Items;
            Beep();
        END_IF;
        Display.Descr[1]:= TO_UINT(cfgIO.Link_toCodes[TO_DINT(mask_List[mask_List_pos])]) - TO_UINT(MaskMng.sig_start) + 1;
        Display.Descr[2]:= mask_List[mask_List_pos];
    END_IF;       
END_FUNCTION

FUNCTION IO_PRG
    IF (StatePRG = STATE_PRG_READY) THEN        // вход в режим редактирования
        StatePRG:=  STATE_PRG_ON; 
        CurRow:= 3;
        CurRow_modePRG:= 0;
    ELSIF (StatePRG = STATE_PRG_ON) THEN        // выход из режима редактирования
        StatePRG:=  STATE_PRG_READY; 
        CurRow:= 0;
        CurRow_modePRG:= 0;
        MaskMng.ValueWasChanged:= TRUE;
    ELSIF (StatePRG = STATE_PRG_OFF) THEN        //ручной режим недоступен
        ShowPopUpMessage(17, SHORT_POPUP_TIME);
    END_IF;
END_FUNCTION

FUNCTION IO_ENTER
     IF (StatePRG = STATE_PRG_ON) THEN  // ручное управление
        IF (CurRow <> 0) THEN           // Пункты 
           // IF (mask_List[mask_List_pos] >= 64) AND (mask_List[mask_List_pos] <= 83) THEN   
            //    Beep();
            //ELSE          // НЕ DP-TOP
                CurRow_modePRG:= CurRow;  
                CurRow:= 0; 
           // END_IF;
        ELSIF (CurRow_modePRG = 3) THEN // Режим             
            CurRow:= CurRow_modePRG;  
            CurRow_modePRG:= 0;
            MaskMng.ValueWasChanged:= TRUE;
        ELSIF (CurRow_modePRG = 4) THEN // Статус
            CurRow:= CurRow_modePRG;  
            CurRow_modePRG:= 0;
            MaskMng.ValueWasChanged:= TRUE;    
        ELSIF (CurRow_modePRG = 5) THEN // Инверсия
            CurRow:= CurRow_modePRG;  
            CurRow_modePRG:= 0;
            MaskMng.ValueWasChanged:= TRUE;   
        END_IF;
    END_IF;    
END_FUNCTION
//---------------------------------------------------------------

// Управление маской коррекции -------------------------------------
FUNCTION CORR_DOWN  
    
    IF (StatePRG = STATE_PRG_ON) THEN      
        (*Analog inputs correction*)
        IF (Display.En_RealValue[1]) THEN
            //Display.value_REAL[1]:= Display.value_REAL[1] - TO_REAL(__SYSVA_KEY_COUNTER)/10.0;
            Display.value_REAL[1]:= Display.value_REAL[1] - Display.value_REAL[8];
            IF (Display.value_REAL[1] < Display.value_MinREAL[1]) THEN
                Display.value_REAL[1]:= Display.value_MaxREAL[1];  
                __SYSVA_KEY_COUNTER:= 0;       
                Beep();       
            END_IF;
        ELSIF (Display.En_IntValue[1]) THEN
            //Display.value_INT[1]:= Display.value_INT[1] - TO_INT(__SYSVA_KEY_COUNTER)/10 - 1;
            Display.value_INT[1]:= Display.value_INT[1] - Display.value_INT[8];
            IF (Display.value_INT[1] < Display.value_MinINT[1]) THEN
                Display.value_INT[1]:= Display.value_MaxINT[1];  
                __SYSVA_KEY_COUNTER:= 0;       
                Beep();       
            END_IF;
        END_IF;      
    ELSE
        mask_List_pos:=  mask_List_pos + TO_DINT(__SYSVA_KEY_COUNTER)/20 + 1;
        IF (mask_List_pos > cnt_Items) THEN     
            __SYSVA_KEY_COUNTER:= 0;
            mask_List_pos:= 1;
            Beep();
        END_IF;
        Display.Descr[1]:= TO_UINT(cfgIO.Link_toCodes[TO_DINT(mask_List[mask_List_pos])]) - TO_UINT(MaskMng.sig_start) + 1;
        Display.Descr[2]:= mask_List[mask_List_pos];
    END_IF;  
    
END_FUNCTION

FUNCTION CORR_UP
    
    IF (StatePRG = STATE_PRG_ON) THEN      
        (*Analog inputs correction*)
        IF (Display.En_RealValue[1]) THEN
            //Display.value_REAL[1]:= Display.value_REAL[1] + TO_REAL(__SYSVA_KEY_COUNTER)/10.0;
            Display.value_REAL[1]:= Display.value_REAL[1] + Display.value_REAL[8];
            IF (Display.value_REAL[1] > Display.value_MaxREAL[1]) THEN
                Display.value_REAL[1]:= Display.value_MinREAL[1];  
                __SYSVA_KEY_COUNTER:= 0;       
                Beep();       
            END_IF;
        ELSIF (Display.En_IntValue[1]) THEN
            //Display.value_INT[1]:= Display.value_INT[1] + TO_INT(__SYSVA_KEY_COUNTER)/10 + 1;
            Display.value_INT[1]:= Display.value_INT[1] + Display.value_INT[8];
            IF (Display.value_INT[1] > Display.value_MaxINT[1]) THEN
                Display.value_INT[1]:= Display.value_MinINT[1];  
                __SYSVA_KEY_COUNTER:= 0;       
                Beep();       
            END_IF;
        END_IF;    
    ELSE
        mask_List_pos:=  mask_List_pos - TO_DINT(__SYSVA_KEY_COUNTER)/20 - 1;
        IF (mask_List_pos < 1) THEN     
            __SYSVA_KEY_COUNTER:= 0;
            mask_List_pos:= cnt_Items;
            Beep();
        END_IF;
        Display.Descr[1]:= TO_UINT(cfgIO.Link_toCodes[TO_DINT(mask_List[mask_List_pos])]) - TO_UINT(MaskMng.sig_start) + 1;
        Display.Descr[2]:= mask_List[mask_List_pos];
    END_IF;
    
END_FUNCTION

FUNCTION CORR_PRG
    IF (StatePRG = STATE_PRG_READY) THEN        // вход в режим редактирования
        StatePRG:=  STATE_PRG_ON; 
        CurRow:= 0;
        CurRow_modePRG:= 3;
    ELSIF (StatePRG = STATE_PRG_ON) THEN        // выход из режима редактирования
        StatePRG:=  STATE_PRG_READY; 
        CurRow:= 0;
        CurRow_modePRG:= 0;
        MaskMng.ValueWasChanged:= TRUE;
    ELSIF (StatePRG = STATE_PRG_OFF) THEN        //ручной режим недоступен
        ShowPopUpMessage(17, SHORT_POPUP_TIME);
    END_IF;
END_FUNCTION

FUNCTION CORR_ENTER
    IF (StatePRG = STATE_PRG_ON) THEN  // ручное управление                   
        MaskMng.ValueWasChanged:= TRUE;    
    END_IF;    
END_FUNCTION
//---------------------------------------------------------------
//----------------------- Main Menu -----------------------------
FUNCTION MainMenu_DOWN   // Переход вниз
  
    IF (CurRow < num_Rows) THEN
        Display.UoM[CurRow]:= Display.UoM[CurRow] - 1;
        CurRow:= CurRow + 1;
        Display.UoM[CurRow]:= Display.UoM[CurRow] + 1;
    ELSE            
        Position:= Position + TO_DINT(__SYSVA_KEY_COUNTER)/20 + 1;
            
        IF (Position > cnt_Items - num_Rows + 1) THEN     
            __SYSVA_KEY_COUNTER:= 0;
            Position:= 1;
            CurRow:= 1;
            //Beep();
        END_IF;
        update_MainMenu_List:= TRUE;
    END_IF;
    
    CurList_Position:= Position + CurRow - 1;
END_FUNCTION

FUNCTION MainMenu_UP   // Переход вверх
  
    IF (CurRow > 1) THEN
        Display.UoM[CurRow]:= Display.UoM[CurRow] - 1;
        CurRow:= CurRow - 1;
        Display.UoM[CurRow]:= Display.UoM[CurRow] + 1;
    ELSE            
        Position:= Position - TO_DINT(__SYSVA_KEY_COUNTER)/20 - 1;
            
        IF (Position < 1) THEN     
            __SYSVA_KEY_COUNTER:= 0;
            Position:= cnt_Items - num_Rows + 1;
            CurRow:= num_Rows;
            //Beep();
        END_IF;
        update_MainMenu_List:= TRUE;
    END_IF;
    
    CurList_Position:= Position + CurRow - 1;
END_FUNCTION

FUNCTION MainMenu_ENTER   // 

    IF (Display.value_Type[CurRow] = 0) // каталог
    THEN   
        IF (CurLevel < 10) THEN 
            SaveMenuPos();
            //CurLevel:= CurLevel + 1; 
            CurMenuPoint:= TO_DINT(Display.Descr[CurRow]);       
            getMainMenu:= TRUE;
        END_IF;
        CurRow:= 1;
        Position:= 1;        
    ELSIF (Display.value_Type[CurRow] = 1) // переход на  другую маску
    THEN        
        //CurMenuPoint:= Display.Descr[CurRow];       
        //getMainMenu:= TRUE;
        SaveMenuPos();
        //CurLevel:= CurLevel + 1; 
        GotoMaskID(TO_USINT(Display.value_MinINT[CurRow]), TO_USINT(Display.value_MaxINT[CurRow]));
        Display.UoM[1]:= 0;
        Display.UoM[2]:= 0;
        Display.UoM[3]:= 0;
        Display.Descr[1]:= 0;
        Display.Descr[2]:= 0;
        Display.Descr[3]:= 0;
        CurRow:= 0;        
    ELSIF (Display.value_Type[CurRow] = 2) // всплывающие окна
    THEN
        SaveMenuPos();
        GotoMaskID(TO_USINT(Display.value_MinINT[CurRow]), TO_USINT(Display.value_MaxINT[CurRow]));    
    END_IF;
    CurList_Position:= 1;
END_FUNCTION    

FUNCTION MainMenu_ESC   // 
    IF (CurLevel > 1) THEN
        LoadMenuPos();
        getMainMenu:= TRUE;
    ELSE
        GlobalEsc();
    END_IF;     
END_FUNCTION         

//---------------------------------------------------------------  
FUNCTION GotoMaskID
//Загрузка маски или петли по MaskID с сохранением пути
    VAR_INPUT
        iMaskID : USINT;
    END_VAR
    
    StoreMaskID();
    LoadMaskID(iMaskID, 0);
END_FUNCTION  

FUNCTION GotoMaskID
//Загрузка маски или петли по MaskID с сохранением пути
    VAR_INPUT
        iMaskID : USINT;
        iParam : USINT; // передаваемый параметр
    END_VAR
    
    StoreMaskID();
    LoadMaskID(iMaskID, iParam);
END_FUNCTION  

FUNCTION LoadMaskID
//Загрузка маски или петли по MaskID
    VAR_INPUT
        iMaskID : USINT;
        iParam : USINT; // передаваемый параметр
    END_VAR

    Display.MaskID:= TO_UINT(iMaskID);
    
    CASE iMaskID OF
        1: // Гл.экран	DF_MID_MAIN
            //GotoLoop(MAIN);
            GotoMask(Main_Mask);
            //При выходе в гл.меню или на гл.экран система возвращается в работу
            SystemPause:= FALSE;
    
        2: // Логин	DF_MID_LOGIN   
            PwdIn := 0;                 // Reset password
            IncrTmp := 0;  
            PwdRes := 0;
            CleanPwd();         
            GotoMask(Pwd_LogIn);

        3: // Осн.меню	DF_MID_MMENU
            MainMenuVisibility_Is_Set:= FALSE;
	        ParamVisibility_Is_Set:= 	FALSE;

            getMainMenu:= TRUE;  
            StatePRG:= STATE_PRG_OFF;  
            GotoMask(Menu_Main);
            //При выходе в гл.меню или на гл.экран система вовзвращается в работу
            SystemPause:= FALSE;

        4: // Управление	DF_MID_ONOFF
            IF (LocalMode = 0)AND(Role_Slave) THEN 
                StatePRG:= STATE_PRG_READY;// режим до редактирования
            ELSE 
                StatePRG:= STATE_PRG_ALWAYS_ON;// режим редактирования
            END_IF;
            GotoLoop(ONOFF);

        5: // Маска загрузки	DF_MID_LOAD  
            IF (UnitOff) THEN
                MaskMng.LoadMaskMode:= iParam;

                IF (iParam = 0) THEN //Загрузка при выходе из конфигуратора
                    ConfigMng.checkConfigFile:= TRUE;
                ELSIF (iParam = 1) THEN //Загрузка при входе в конфигуратор
                    ConfigMng.checkConfigFile:= TRUE;
                ELSIF (iParam = 2) THEN   //Загрузка конфигуратора из конфигуратора                 
                    //CurLevel:= ConfigStartLevel; возвращаемся к началу конфигуратора
                    //CurList_Position:= 1;
                   IsConfigChanged:= TRUE;
                    load_Config:= TRUE;
                ELSIF (iParam = 3) THEN   //Сохранение конфигуратора без выхода
                    save_Config:= TRUE;
                ELSIF (iParam = 4) THEN   //Сохранение конфигуратора с выходом
                    save_Config:= TRUE;
                END_IF;

                GotoMask(LoadConfig_Mask);   
            ELSE
                ShowPopUpMessage(1, POPUP_TIME, TRUE);//  Выключите установку для изменения настроек!
            END_IF;
        6: //Настройки Ethernet DF_MID_ETH  
            read_EthernetSettings:= TRUE;          
            StatePRG:= STATE_PRG_READY;
            GotoMask(EthernetConfig_Mask);

        7: // Управление расписанием	DF_MID_SCH_MG
            temp_En_Schedule:= En_Schedule;
            StatePRG:= STATE_PRG_ON;
            GotoMask (Schedule_Manage);

        8: // Журнал аварий	DF_MID_ALOG
            gotoAlarmLog();

        9: // Последовательности	DF_MID_SEQ
            GotoLoop(SEQUENCES);

        10: // Мастер конфигурации	DF_MID_CFG_M
            IF (iParam = 1) THEN
                CurMenuPoint:=  0;	
                Position:= 1; 
                CurList_Position:= 1;
                CurRow:= 1;    
                CurRow_modePRG:=    0;
                ConfigStartLevel:= CurLevel;                
            END_IF;

            getConfigMenu:= TRUE;
            GotoMask(REF_CONFIGURATOR);                 

        11: //Дискретные входы	DF_MID_IO_DI
            CurRow:=            1;
            CurRow_modePRG:=    0;
            getIOList:=         TRUE;
            IF (UnitOn) THEN
                StatePRG:= STATE_PRG_OFF;
            ELSE
                StatePRG:= STATE_PRG_READY;
            END_IF;
            GotoMask(IO_DI);

        12: //Аналоговые входы	DF_MID_IO_AI
            CurRow:=            1;
            CurRow_modePRG:=    0;
            getIOList:=         TRUE;
            IF (UnitOn) THEN
                StatePRG:= STATE_PRG_OFF;
            ELSE
                StatePRG:= STATE_PRG_READY;
            END_IF;
            GotoMask(IO_AI);

        13: //Дискретные выходы	DF_MID_IO_DO
            CurRow:=            1;
            CurRow_modePRG:=    0;
            getIOList:=         TRUE;
            IF (UnitOn) THEN
                StatePRG:= STATE_PRG_OFF;
            ELSE
                StatePRG:= STATE_PRG_READY;
            END_IF;
            GotoMask(IO_DO);

        14: //Аналоговые выходы	DF_MID_IO_AO
            CurRow:=            1;
            CurRow_modePRG:=    0;
            getIOList:=         TRUE;
            IF (UnitOn) THEN
                StatePRG:= STATE_PRG_OFF;
            ELSE
                StatePRG:= STATE_PRG_READY;
            END_IF;
            GotoMask(IO_AO);

        15: //Уставка	DF_MID_SET
            getParam:= TRUE;
            IF (LocalMode = 0)AND(Role_Slave) THEN 
                StatePRG:= STATE_PRG_READY;// режим до редактирования
            ELSE 
                StatePRG:= STATE_PRG_ALWAYS_ON;// режим редактирования
            END_IF;
            GotoLoop(SET);

        16: //Выход	DF_MID_OUT
            GotoMask(Pwd_LogOut);

        17: //Роль устройства	DF_MID_GROLE
            temp_Role:= Role;
            StatePRG:= STATE_PRG_ALWAYS_ON;
            Gotomask(DeviceRole);   
            GotoCursor (0,10);// кидаем за пределы экрана. ТОЛЬКО ДЛЯ 1 IO переменной на экране! Использовать Compare() без NextField!

        18: //Настройки группы	DF_MID_GSET
            IF (Role_Master) THEN 
                IF (Num_Slaves > 0) THEN
                    CurSlave:=  1;
                    CurSlaveShow:=  TRUE;
                    StatePRG:= STATE_PRG_READY;// режим готовности к редактированию
                    GotoMask (SlaveSet);                    
                ELSE
                    ShowPopUpMessage(6, POPUP_TIME, TRUE);//  Состав группы не объявлен!
                END_IF;                
            ELSE                    
                StatePRG:= STATE_PRG_ON;// режим готовности к редактированию
                Gotomask(LocalSet);// если ведомый - местные настройки (выбор режима)   
                GotoCursor(0,10);         
            END_IF;    

        19: //Состав группы	DF_MID_GSTCT            
            IF (Role_Master) THEN 
                StatePRG:= STATE_PRG_ALWAYS_ON;// режим редактирования сразу  
                Gotomask(GroupStructure);// если мастер-переходим к выбору состава группы 
                GotoCursor (0,10);// кидаем за пределы экрана. ТОЛЬКО ДЛЯ 1 IO переменной на экране! Использовать Compare() без NextField!               
           ELSE 
                ShowPopUpMessage(2, POPUP_TIME, TRUE);//  Для доступа, выберите роль устройства: ВЕДУЩИЙ // если ведомый - заглушка
           END_IF;   

        20: // Маска параметров	DF_MID_PAR
            //setParamMask(TO_USINT(Display.value_MaxINT[CurRow]));
            CurParam:=          iParam; 
            getParamMenu:=      TRUE;
            cnt_Items:=         0;
            StatePRG:=          STATE_PRG_READY;
            GotoMask(REF_Parameters);

        21: //ХМ: Статистика	DF_MID_CM_STA   
            //Show_CompStats:= TRUE;   
            Display.Index:=     -1;   
            StatePRG:=          STATE_PRG_READY;
            GotoLoop(FRIDGE_STATS);   

        22: // Дата и время	DF_MID_DTIME
            StatePRG:=          STATE_PRG_READY;
            GotoLoop(DATETIME);
        
        23: //Язык	DF_MID_LANG
            StatePRG:=          STATE_PRG_ALWAYS_ON;
            Gotomask(Language);

        24: //Управление доступом	DF_MID_PASS
            IncrTmp :=          0;  
            StatePRG:=          STATE_PRG_READY;
            GotoMask(PWDCHG);  

        25: //Коррекция датчиков	DF_MID_SCORR  
            MaskMng.getCorrList:= TRUE;
            StatePRG:= STATE_PRG_READY;
            GotoMask(CORR_AI);

        26: //Настройки ModBus	DF_MID_MODBUS
            IF (is_TOP) THEN
                ShowPopUpMessage(9, POPUP_TIME, TRUE);//  Доступно только со шкафа управления!
            // 20.07.20 v.2.6.0.0 
            //ELSIF (IsDLE)AND(Role_Slave) THEN
            //    ShowPopUpMessage(10, POPUP_TIME, TRUE);//  Доступно только с ВЕДУЩЕГО!
            ELSE
                IF (Ethernet.Protocol[1] = 4) OR (Ethernet.Protocol[1] = 5) THEN
                    MB_port:= 1;
                ELSIF (BMS_card.Protocol = 4) OR (BMS_card.Protocol = 5) THEN
                    MB_port:= 2;
                ELSIF (BMS2.Protocol = 4) OR (BMS2.Protocol = 5) THEN
                    MB_port:= 3;
                ELSE
                    MB_port:= 0;
                END_IF;
                Temp_MB_port:= MB_port;
                Temp_MB_Address:= MB_Address;  
                Show_ports();  
                StatePRG:= STATE_PRG_READY;             
                GotoLoop(MODBUS);
            END_IF;

        27: //Обновление	DF_MID_UPGR
            IF (UnitOff) THEN
                IF (iParam = 1) THEN //USB
                    IF (isUSB) THEN
                        Upgrade.UpgradeDrive:= 1; //SYS_DISK_USB
                        Upgrade.Check_Upgrade:= TRUE;
                        StatePRG:= STATE_PRG_ALWAYS_ON;
                        NextCycleAction:= 4; // GotoLoop (UPGRADE);
                    ELSE
                        //Вставьте USB-накопитель
                        ShowPopUpMessage(24, SHORT_POPUP_TIME, TRUE); 
                    END_IF;
                ELSE
                    Upgrade.UpgradeDrive:= 0; //SYS_DISK_INTERNAL
                    Upgrade.Check_Upgrade:= TRUE;
                    StatePRG:= STATE_PRG_ALWAYS_ON;
                    NextCycleAction:= 4; // GotoLoop (UPGRADE);                    
                END_IF;
            ELSE
                ShowPopUpMessage(1, POPUP_TIME, TRUE);//  Выключите установку для изменения настроек!
            END_IF;

        28: //Расписание	DF_MID_SCH
            IF (is_TOP) THEN
                ShowPopUpMessage(9, POPUP_TIME, TRUE);//  Доступно только со шкафа управления!
            ELSIF (IsDLE)AND(Role_Slave) THEN
                ShowPopUpMessage(10, POPUP_TIME, TRUE);//  Доступно только с ВЕДУЩЕГО!
            ELSE
                StatePRG:= STATE_PRG_READY;      
                GotoLoop (SCHEDULE);
            END_IF;

        29: //Режим управления	DF_MID_CMOD
            IF (is_TOP) THEN
                ShowPopUpMessage(9, POPUP_TIME, TRUE);//  Доступно только со шкафа управления!
            ELSIF (IsDLE)AND(Role_Slave)AND NOT(LocalMode) THEN
                ShowPopUpMessage(10, POPUP_TIME, TRUE);//  Доступно только с ВЕДУЩЕГО!
            ELSE
                temp_Mode_Control:= Mode_Control;
                StatePRG:= STATE_PRG_ON;
                GotoLoop (CONTROL_MODE);
            END_IF;            

        30: //Маска сообщения	DF_MID_MSG  
            ;

        31: //Маска вопроса	DF_MID_QSTN                
            ReturnToPrevMask:= TRUE;
            StatePRG:= STATE_PRG_OFF;
            DTPopUp:= 0; //без таймера всплывающего окна
            PopUp_Question:= iParam;
            Gotomask(PopUp_Question_Mask);

        32: //Маска ведомых   DF_MID_SLST  
            MaskMng.setStatePRG:= TRUE;
            GotoLoop(SLAVESTATES);

        33: //Роль устройства	DF_MID_ROLE
            temp_Role:= Role;
            StatePRG:= STATE_PRG_ALWAYS_ON;// режим редактирования сразу      
            GotoLoop(UNITCONFIG);    
            GotoCursor (0,10);// кидаем за пределы экрана. ТОЛЬКО ДЛЯ 1 IO переменной на экране! Использовать Compare() без NextField!          

        34: //Настройки BMS   DF_MID_BMS
            IF (Role_Slave)OR(is_TOP) THEN
                Temp_MB_Baudrate:= BMS2.Baudrate;
                Temp_MB_Parity:= BMS2.Parity;
                Temp_MB_StopBits:= BMS2.StopBits;
            ELSE
                Temp_MB_Baudrate:= FBus2.Baudrate;
                Temp_MB_Parity:= FBus2.Parity;
                Temp_MB_StopBits:= FBus2.StopBits;
            END_IF;
            En_MB_BMS:= TRUE;
            StatePRG:= STATE_PRG_READY;// 
            GotoLoop(BMS_SETTINGS);

         35: //Загрузка/Сохранение на USB DF_MID_PARMNG
            IF (isUSB) THEN
                Display.Hint:= TO_UINT(iParam);
                IF (iParam = 1) THEN
                    ShowPopUpQuestion(23, TRUE); //Сохранить параметры на USB?
                ELSE                    
                    ShowPopUpQuestion(22, TRUE); //Загрузить параметры с USB?
                END_IF;
            ELSE
                ShowPopUpMessage(24, SHORT_POPUP_TIME, TRUE); //Вставьте USB-накопитель
            END_IF;

         36: //Дискретные входы (конфиг) DF_MID_CFG_DI                
            Position:= 1;
            CurRow:= 1;
            cnt_Items:= 0;
            getIOConfig:= TRUE;
            
            GotoMask(CFG_DI);                

         37: //Аналоговые входы (конфиг) DF_MID_CFG_AI
            Position:= 1;
            CurRow:= 1;
            cnt_Items:= 0;
            getIOConfig:= TRUE;

            GotoMask(CFG_AI);

         38: //Дискретные выходы (конфиг) DF_MID_CFG_DO
            Position:= 1;
            CurRow:= 1;
            cnt_Items:= 0;
            getIOConfig:= TRUE;

            GotoMask(CFG_DO);

         39: //Аналоговые выходы (конфиг) DF_MID_CFG_AO
            Position:= 1;
            CurRow:= 1;
            cnt_Items:= 0;
            getIOConfig:= TRUE;

            GotoMask(CFG_AO);

         40: //Холодильная машина DF_MID_COLM
            StatePRG:= STATE_PRG_OFF;
            GotoLoop(FRIDGE);

         41: //Карта сети DF_MID_NETM
            StatePRG:= STATE_PRG_OFF;
            IF (Role_Master) THEN // для мастера
                IF (Num_Slaves > 0) THEN
                    Gotomask(NetMap);
                    IF (CurPosition = 0)OR(CurPosition > Num_Slaves) THEN 
                        CurPosition:=   1;// в первую позицию, если впервые. Остальные запоминаем
                    END_IF;
                    CurShow[CurPosition]:=  TRUE;                               
                ELSE
                    ShowPopUpMessage(6, POPUP_TIME); //Состав группы не объявлен!
                END_IF; 
            ELSE // для ведомых
                Gotomask(MasterState);
            END_IF;

        42: //Информация DF_MID_INFO
            GotoLoop(INFO);

        43: //Набор уставок	DF_MID_PSET
            getParam:= TRUE;
            StatePRG:= STATE_PRG_ALWAYS_ON;// режим редактирования
            GotoLoop(PRESETS);
            GotoCursor(0, 10);

        44: //Пароувлажнитель DF_MID_HUMID
            GotoLoop(HUMID);

        45: //Настройки соединения DF_MID_RESSET
            StatePRG:=              STATE_PRG_READY;
            MaskMng.get_Slave_IP:=  TRUE;
            GotoLoop(RES_SLAVE_SETTINGS);

    END_CASE;    
END_FUNCTION

FUNCTION StoreMaskID
//Сохраняем позицию маски
    MaskIDStore[MaskIDLevel]:= TO_USINT(Display.MaskID);
    IF (MaskIDLevel < 9) THEN
        MaskIDLevel:= MaskIDLevel + 1;
    END_IF;
END_FUNCTION

FUNCTION ReStoreMaskID
//Загружаем позицию маски    
    IF (MaskIDLevel > 0) THEN
        MaskIDLevel:= MaskIDLevel - 1;
    END_IF;
    Display.MaskID:= TO_UINT(MaskIDStore[MaskIDLevel]);
    MaskIDStore[MaskIDLevel]:= 0;    
    LoadMaskID(TO_USINT(Display.MaskID), 0);
END_FUNCTION

FUNCTION SaveMenuPos
//Сохраняем состояние меню
    Display.Path.MenuPoint[CurLevel]:=  CurMenuPoint;
    Display.Path.Position[CurLevel]:=   Position;
    Display.Path.Row[CurLevel]:=        CurRow; 
    Display.Path.Row_PRG[CurLevel]:=    CurRow_modePRG;

    IF (CurRow = 0) AND (CurRow_modePRG <> 0) THEN
        CurMenuPoint:= TO_DINT(Display.Descr[CurRow_modePRG]);
    ELSIF (CurRow <> 0) THEN
        CurMenuPoint:= TO_DINT(Display.Descr[CurRow]);
    END_IF;

    IF (CurLevel < 10) THEN
        CurLevel:= CurLevel + 1;
    ELSE 
         CurLevel:= 10;
    END_IF; 
END_FUNCTION

FUNCTION LoadMenuPos
//Загружаем состояние меню     
    IF (CurLevel > 0) THEN
        CurLevel:= CurLevel - 1;
    ELSE 
         CurLevel:= 0;
    END_IF;

    CurMenuPoint:=      Display.Path.MenuPoint[CurLevel];
    Position:=          Display.Path.Position[CurLevel];
    CurRow:=            Display.Path.Row[CurLevel];  
    CurRow_modePRG:=    Display.Path.Row_PRG[CurLevel];     
    CurList_Position:=  Position + CurRow - 1;

    Display.Path.MenuPoint[CurLevel]:=      0;
    Display.Path.Position[CurLevel]:=       0;
    Display.Path.Row[CurLevel]:=         0;  
    Display.Path.Row_PRG[CurLevel]:= 0;    
END_FUNCTION

FUNCTION ClearHistory
//Очистка истории
    MaskIDLevel:= 0;
    MaskIDStore[0]:= 0;
    MaskIDStore[1]:= 0;
    MaskIDStore[2]:= 0;
    MaskIDStore[3]:= 0;
    MaskIDStore[4]:= 0;
    MaskIDStore[5]:= 0;
    MaskIDStore[6]:= 0;
    MaskIDStore[7]:= 0;
    MaskIDStore[8]:= 0;
    MaskIDStore[9]:= 0;
    Position:= 0;
    CurRow:= 0;
    CurList_Position:= 0;

    CurLevel:= 0;
    Display.Path.MenuPoint[0]:= 0;
    Display.Path.Position[0]:= 0;
    Display.Path.Row[0]:= 0;
    Display.Path.MenuPoint[1]:= 0;
    Display.Path.Position[1]:= 0;
    Display.Path.Row[1]:= 0; 
    Display.Path.MenuPoint[2]:= 0;
    Display.Path.Position[2]:= 0;
    Display.Path.Row[2]:= 0; 
    Display.Path.MenuPoint[3]:= 0;
    Display.Path.Position[3]:= 0;
    Display.Path.Row[3]:= 0; 
    Display.Path.MenuPoint[4]:= 0;
    Display.Path.Position[4]:= 0;
    Display.Path.Row[4]:= 0; 
    Display.Path.MenuPoint[5]:= 0;
    Display.Path.Position[5]:= 0;
    Display.Path.Row[5]:= 0; 
    Display.Path.MenuPoint[6]:= 0;
    Display.Path.Position[6]:= 0;
    Display.Path.Row[6]:= 0; 
    Display.Path.MenuPoint[7]:= 0;
    Display.Path.Position[7]:= 0;
    Display.Path.Row[7]:= 0; 
    Display.Path.MenuPoint[8]:= 0;
    Display.Path.Position[8]:= 0;
    Display.Path.Row[8]:= 0; 
    Display.Path.MenuPoint[9]:= 0;
    Display.Path.Position[9]:= 0;
    Display.Path.Row[9]:= 0;      
    Display.Path.MenuPoint[10]:= 0;
    Display.Path.Position[10]:= 0;
    Display.Path.Row[10]:= 0;  
    
END_FUNCTION
FUNCTION Hide_Baudrate_Class_DOWN
    CASE __TMP_UDINT OF
        1200:
            Beep();
            __TMP_UDINT:= 375000;
        2400:
            __TMP_UDINT:= 1200;
        4800:
            __TMP_UDINT:= 2400;
        9600:
            __TMP_UDINT:= 4800;
        19200:
            __TMP_UDINT:= 9600;
        38400:
            __TMP_UDINT:= 19200;
        57600:
            __TMP_UDINT:= 38400;
        76800:
            __TMP_UDINT:= 57600;
        115200:
            __TMP_UDINT:= 76800;
        375000:
            __TMP_UDINT:= 115200;
    END_CASE;
END_FUNCTION

FUNCTION Hide_Baudrate_Class_UP
    CASE __TMP_UDINT OF
        1200:
            __TMP_UDINT:= 2400;
        2400:
            __TMP_UDINT:= 4800;
        4800:
            __TMP_UDINT:= 9600;
        9600:
            __TMP_UDINT:= 19200;
        19200:
            __TMP_UDINT:= 38400;
        38400:
            __TMP_UDINT:= 57600;
        57600:
            __TMP_UDINT:= 76800;
        76800:
            __TMP_UDINT:= 115200;
        115200:
            __TMP_UDINT:= 375000;
        375000:
            Beep();
            __TMP_UDINT:= 1200;
    END_CASE;
END_FUNCTION

FUNCTION Net_Settings_ESC
	IF (StatePRG = STATE_PRG_READY) THEN 
        GlobalEsc();
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        Compare(); 
        IF (Role_Slave) OR (is_TOP) THEN   
            IF (Temp_MB_Baudrate <> BMS2.Baudrate) OR
                (Temp_MB_Parity <> BMS2.Parity) OR
                (Temp_MB_StopBits <> BMS2.StopBits) 
                THEN           
                ShowPopUpQuestion(20);// изменение настроек сети
            ELSE
                GlobalEsc();        
            END_IF;           
        ELSE
            IF (Temp_MB_Baudrate <> FBus2.Baudrate) OR
                (Temp_MB_Parity <> FBus2.Parity) OR
                (Temp_MB_StopBits <> FBus2.StopBits) 
                THEN           
                ShowPopUpQuestion(20);// изменение настроек сети
            ELSE
                GlobalEsc();       
            END_IF;  
              
        END_IF;                  
    END_IF;
END_FUNCTION

FUNCTION Net_Settings_PRG
	 IF (StatePRG = STATE_PRG_READY) THEN 
        StoreMask();
        StatePRG:= STATE_PRG_ON;    
        NextCycleAction:= 1;        
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        Compare(); 
        IF (Role_Slave) OR (is_TOP) THEN
            IF (Temp_MB_Baudrate <> BMS2.Baudrate) OR
                (Temp_MB_Parity <> BMS2.Parity) OR
                (Temp_MB_StopBits <> BMS2.StopBits) 
                THEN           
                ShowPopUpQuestion(20);// изменение настроек сети
            ELSE
                StatePRG:= STATE_PRG_READY;   
                NextCycleAction:=   1;        
            END_IF;  
            
        ELSE
            IF (Temp_MB_Baudrate <> FBus2.Baudrate) OR
                (Temp_MB_Parity <> FBus2.Parity) OR
                (Temp_MB_StopBits <> FBus2.StopBits) 
                THEN           
                ShowPopUpQuestion(20);// изменение настроек сети
            ELSE
                StatePRG:= STATE_PRG_READY;   
                NextCycleAction:=   1;        
            END_IF;               
        END_IF;      
    END_IF;
END_FUNCTION

FUNCTION Stats_1_UP
    Display.Index:= Display.Index - 1;
    //IF (Display.Index > 1) THEN 
        //Display.Index:= Display.Index - 1;
    //ELSE
        //Display.Index:= EQ_Cooler.CompNum;
    //END_IF;
END_FUNCTION

FUNCTION Stats_1_DOWN
    Display.Index:= Display.Index + 1;
    //IF (Display.Index < EQ_Cooler.CompNum) THEN 
        //Display.Index:= Display.Index + 1;
    //ELSE
        //Display.Index:= 1;
    //END_IF;
END_FUNCTION

// сброс наработки компрессора
FUNCTION Stats_1_PRG
    IF (PwdTyp >= 2) THEN    // only if logged as service or manufacturer
        IF (Display.Index = 1) THEN
            ShowPopUpQuestion(8);// Сбросить статистику компрессора 1?
        ELSIF (Display.Index = 2) THEN
            ShowPopUpQuestion(9);// Сбросить статистику компрессора 2?
        ELSIF (Display.Index = 3) THEN
            ShowPopUpQuestion(10);// Сбросить статистику компрессора 3?
        END_IF;
    ELSE  
        ShowPopUpMessage(4, POPUP_TIME);//  Введите Сервисный пароль для изменения Сервисных настроек
    END_IF;    
END_FUNCTION

FUNCTION EthernetConfig_Mask_ESC
    IF (StatePRG = STATE_PRG_READY) THEN 
        GlobalEsc();
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        Compare(); 
	    ShowPopUpQuestion(6, TRUE); //Сохранить настройки Ethernet?
    END_IF;
END_FUNCTION

FUNCTION EthernetConfig_Mask_PRG

    IF (StatePRG = STATE_PRG_READY) THEN 
        StoreMask();
        StatePRG:= STATE_PRG_ON;     
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        Compare(); 
	    write_EthernetSettings:= TRUE;
        StatePRG:= STATE_PRG_READY;  
    END_IF; 

    NextCycleAction:=   1;  
END_FUNCTION

FUNCTION Res_Slave_Settings_Mask_ESC
    IF (StatePRG = STATE_PRG_READY) THEN 
        GlobalEsc();
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        Compare(); 
	    ShowPopUpQuestion(6, TRUE); //Сохранить настройки Ethernet?
    END_IF;
END_FUNCTION

FUNCTION Res_Slave_Settings_Mask_PRG

    IF (StatePRG = STATE_PRG_READY) THEN 
        StoreMask();
        StatePRG:= STATE_PRG_ON;     
    ELSIF (StatePRG = STATE_PRG_ON) THEN 
        Compare(); 
	    MaskMng.setChanges:= TRUE;
        StatePRG:= STATE_PRG_READY;  
    END_IF; 

    NextCycleAction:=   1;  
END_FUNCTION

FUNCTION Hide_DHCP_BOOL_SWAP_Class_ENTER
	IF NOT(Ethernet.DHCP) THEN
        GotoNextField();
    END_IF;
END_FUNCTION


FUNCTION Sequences_Mask_DOWN
    //Если есть куда двигаться и есть стрелка
    IF (Display.MaskHeader < 1) AND (Display.value_BOOL[7] <> 0) THEN
        Display.MaskHeader:= Display.MaskHeader + 1;
    END_IF;
END_FUNCTION

FUNCTION Sequences_Mask_UP	
    //Если есть куда двигаться и есть стрелка
    IF (Display.MaskHeader > 0) AND (Display.value_BOOL[7] <> 0) THEN
        Display.MaskHeader:= Display.MaskHeader - 1;
    END_IF;
END_FUNCTION

FUNCTION Preset_PRG
    MaskMng.gotoParam:= TO_USINT(Display.value_INT[1]); //переходим в текущий набор
    CurList_Position:= 1;
END_FUNCTION

FUNCTION Preset_DOWN
    Display.value_INT[1]:= Display.value_INT[1] + TO_INT(__SYSVA_KEY_COUNTER)/20 + 1;;
	IF (Display.value_INT[1] > Display.value_MaxINT[1]) THEN
        Display.value_INT[1]:= Display.value_MinINT[1];
    END_IF;
    downArrow:= TRUE;
END_FUNCTION

FUNCTION Preset_UP
    Display.value_INT[1]:= Display.value_INT[1] - TO_INT(__SYSVA_KEY_COUNTER)/20 - 1;;
	IF (Display.value_INT[1] < Display.value_MinINT[1]) THEN
        Display.value_INT[1]:= Display.value_MaxINT[1];
    END_IF;
    upArrow:= TRUE;
END_FUNCTION

FUNCTION Preset_ENTER
	setParam:= TRUE;
END_FUNCTION


FUNCTION LoadMask // Функция для загрузки маски из стратегии
    IF (LoadMask.MaskID <> 0) THEN
        GotoMaskID(LoadMask.MaskID, LoadMask.Param);
        LoadMask.MaskID:=   0;
        LoadMask.Param:=    0;
    END_IF;
END_FUNCTION


FUNCTION Main_Mask_ESC //Функция перехода на следующий контроллер в pLAN сети
	IF(__SYSVA_KEY_COUNTER >= 2) THEN
        __SYSVA_KEY_COUNTER:= 0;
        ReleaseTerminal();
    END_IF;
END_FUNCTION

FUNCTION Main_Mask_ESC_DOWN //Функция перехода на следующий контроллер в pLAN сети
    ReleaseTerminal();
END_FUNCTION

FUNCTION Goto_FRIDGE_PARAMS //Переход к параметрах ХМ
    GotoMaskID(20, 10); //(DF_MID_PAR, DF_PRM_CM_PAR);
END_FUNCTION

FUNCTION Goto_FRIDGE_STATS //Переход к параметрах ХМ
    GotoMaskID(21,0); //DF_MID_CM_STA
END_FUNCTION

