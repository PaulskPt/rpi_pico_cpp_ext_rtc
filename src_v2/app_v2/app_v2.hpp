#pragma once

#ifndef _RTC_PSK_NEW_HPP
#define _RTC_PSK_NEW_HPP
#include "../pico_explorer/pico_explorer.hpp"
#include <stdio.h>
#include <stdint.h>
//#include "../pico_graphics/pico_graphics.hpp"
#include "../rv3028/rv3028.hpp"
#include <float.h>
#include <string>
#include <vector>
#include <cstdint>  // uint8_t etc.
#include <fstream>
#include <iomanip>
#include <iostream>

//#include "../../pico-sdk/src/common/pico_util/include/pico/util/datetime.h"
#include "../../../pico-sdk/src/common/pico_base/include/pico/types.h"

using namespace pimoroni;

#define yy 0
#define mm 1
#define dd 2
#define wd 3
#define hh 4
#define mi 5
#define ss 6 

const uint8_t USBPWR_PIN = 24;
const uint8_t LED_PIN = 25; // PICO_DEFAULT_LED_PIN;  // Pin 25

const std::vector<int> ofs = {20, 60, 110, 180};
const std::vector<int> ofs3 = {5,35,65,95,125,155,185,215, 235};
const std::vector<std::string> itmlst = {"ss", "mi", "hh", "wd", "dd", "mo", "yy", "rs", "mu", "??"};
const std::vector<std::string> itmlst_h = {"seconds", "minute", "hour", "weekday", "day", "month", "year", "reset", "menu", "help"};
const std::vector<std::string> wdays = {"Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"};
const std::vector<std::string> mnths = {"   ", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
const std::vector<std::string> settings = {"IsLED", "Is12HR", "IsALRM", "IsTIMR", "bGND", "fGND", "EXIT"};
const std::vector<std::string> settings_menu = {"led OnOff", "12/24 hrs", "set Alarm", "set Timer", "b_GND clr", "f_GND clr", "menu exit"};
const std::vector<std::string> colours = { "blk", "red", "aub", "ora", "yel", "grn", "blu", "whi"};
const std::vector<std::string> colours_h = { "black", "red", "aubergine", "orange", "yellow", "green", "blue", "white"};
// display background colour sets vectors of integer arrays
const std::vector<int> disp_black =  {0,    0,    0};   // black   see: https://rgbcolorcode.com/color/yellow
const std::vector<int> disp_red =    {120,  0,    0};   // aubergine
const std::vector<int> disp_auber =  {120, 40,   60};   // aubergine
const std::vector<int> disp_orange = {255, 128,   0};   // orange
const std::vector<int> disp_yellow = {255, 255,   0};   // yellow
const std::vector<int> disp_green =  {0,   120,   0};   // green
const std::vector<int> disp_blue =   {0,     0, 120};   // blue
const std::vector<int> disp_violet = {170,   0, 255};   // violet
const std::vector<int> disp_white =  {255, 255, 255};   // white

enum menu_order
{
  MENU_MAIN,
  MENU_SETTINGS,
  MENU_BACK
};

enum menu_settings_order
{
  SETT_LED,         // 0
  SETT_12HR,        // 1
  SETT_ALRM,        // 2
  SETT_TIMR,        // 3
  SETT_BGND,        // 4
  SETT_FGND,        // 5
  SETT_BACK         // 6
};

enum menu_itm_order
{
  ITM_SECONDS,      // 0
  ITM_MINUTES,      // 1
  ITM_HOURS,        // 2
  ITM_WEEKDAY,      // 3
  ITM_DATE,         // 4
  ITM_MONTH,        // 5
  ITM_YEAR,         // 6
  ITM_RESET,        // 7
  ITM_MENU,         // 8
  ITM_HELP          // 9
};

enum disp_colour_order
{
  DISP_BLACK,       // 0
  DISP_RED,         // 1
  DISP_AUBERGINE,   // 2
  DISP_ORANGE,      // 3
  DISP_YELLOW,      // 4
  DISP_GREEN,       // 5
  DISP_BLUE,        // 6
  DISP_WHITE        // 7
};

enum z_main_loop_order
{
    DOIT_WEEKDAY,   // 0
    DOIT_MONTH,     // 1
    DOIT_YEAR,      // 2
    DOIT_TIME       // 3
};

enum setup_call_order
{
  SU_RTC_INIT,                 // 0 0x01
  SU_RTC_SETUP,                // 1 0x02
  SU_REST_FM_INIT_LED,         // 2 0X04
  SU_REST_FM_INIT_BF,          // 3 0x08
  SU_RTC_UPDATETIME,           // 4 0x20
  SU_UPD_APP_TIME,             // 5 0x40
  SU_SUCCESSFULL,              // 6
  SU_FAILED,                   // 7
  SU_UNKNOWN                   // 8
};

int menu = MENU_MAIN; // Set to use the main menu
int itm = ITM_HELP;  // Set start value of itm. Was: (int)itmlst.size()-1;   0 = ss, 1 = mi, 2 = hh, 3 = wd, 4 = dd, 5 = mo, 6 = yy, 7 = rs, 8 = ?? (help)
int sett_itm = SETT_LED; // idem for settings
int bgnd_colour = DISP_ORANGE; // Global display background colour
int fgnd_colour = DISP_YELLOW;  // Global display foreground (text) colour
int p_x_default = 15;
int usr_dat_len_at_backup = 0;  // Holds the length (in bytes) of certain user data being saved to EEPROM (see backp_to_EP() and rest_fm_EP() )
int app_time_IsPM = -1;

char datetime_buf[256];
char *datetime_str = &datetime_buf[0];
/*
* Start on Friday 1st of January 2021 00:00:00
* datetime_t is defined in: I:\pico\pico-sdk\src\common\pico_base\include\pico\types.h
* 0 is Sunday, so 5 is Friday
*/

#ifndef TIME_ARRAY_LENGTH
#define TIME_ARRAY_LENGTH 7 // Total number of writable values in device
#endif

std::vector<int> app_time = { 0, 0, 12, 5, 1, 5, 2021};  // {secs, mins, hrs, weekday, date, month, year}
std::vector<int> v_settings = { 1, 1, 0, 0, 0, 0, 0};  // IsLED, Is12, IsAM, IsALRM, IsTIMR, fGND, bGND

// See: https://codereview.stackexchange.com/questions/242052/conversion-into-hexadecimal-using-c , by  by @Malvineous
typedef std::vector<uint8_t> buffer;

// We need to make a custom type so we can control which function the compiler will call.
struct hexbuffer {
    const buffer& innerbuf;
};
//-------------------------------------------------------------------------------------------------------

typedef struct {
  float r;
  float g;
  float b;
} rgb_t;

// 45 Functions pre-defines:

/*! \brief operator overload (See note at typedef buffer above.
 *  \ingroup rtc_paulsk
 *
 * \param vector of char
 * \return string
 */
std::ostream& operator << (std::ostream&, const hexbuffer&);

/*! \brief a_itm_handler, handles the clock items
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return boolean
 */
bool a_itm_handler(); 

/*! \brief menu handler function
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return int
 */
int a_menu_handler();

/*! \brief backup_to_EP(), backups user data, like foreground/background colours, to User EEPROM memory (00h - 2Ah = 43 bytes
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return boolean
 */
bool backp_to_EP();

/*! \brief btn_ab_itm, directions: previous/next and down/up
 *  \ingroup rtc_paulsk
 *
 * \param boolean dr
 * \return boolean
 */
bool btn_ab_itm(bool dr);

/*! \brief btn_ab_settings, menu for various settings like built-in LED, 24/12 hour mode, alarm and timer
 *  \ingroup rtc_paulsk
 *
 * \param bool  // if True choose itm if false choose sett_itm
 * \return boolean
 */
bool btn_ab_settings(bool);

/*! \brief btn_help, shows help info on the lcd display (former part of btn_msgd with ln ==3)
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return None
 */
void btn_help();

/*! \brief btn_ID, gets the Id nr of the button pressed
 *  \ingroup rtc_paulsk
 *
 * \param uint8_t, k, the numeric value of the button pressed
 * \return char, the letter of the button pressed: A, B, X or Y.
 */
char btn_ID(uint8_t);

/*! \brief btn_msg. Prints  a buttons info start msg on REPL
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return None
 */
void btn_msg();

/*! \brief btn_msgd. Prints msg on REP and on display
 *  \ingroup rtc_paulsk
 *
 * \param std::string text to be printed on the display
 * \param int   row nr, ln, of the display on which the text to be displayed
 *
 * \return bool
 */
void btn_msgd(std::string, int);

/*! \brief btn_xy_itm, handles the value of the setting count
 *  \ingroup rtc_paulsk
 *
 * \param bool dr, the direction of movement: if False: previous, if True: next
 * \return None
 */
void btn_xy_itm(bool);

/*! \brief btn_xy_settings, handles the value of the itm count sett_itm
 *  \ingroup rtc_paulsk
 *
 * \param bool dr, the direction of movement: if False: previous, if True: next
 * \return None
 */
void btn_xy_settings(bool);

/*! \brief ck_btn_press, checks if one of the four buttons has been pressed. If so, returns true. If not returns false
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return boolean
 */
bool ck_btn_press();

/*! \brief ck_YN, presents user with a question and lets user choose by pressing btn Y for 'Yes' or '12' or btn X for 'No' or '24'
 *  \ingroup rtc_paulsk
 *
 * \param Txt string, e.g.: "12/24 mode"
 * \param btnX string, e.g.: "btn X = 24"
 * \param btnY string, e.g.: "btn Y = 12"
 * \param None
 * \return boolean e.g. true means here : 24 hrs, false 12 hrs
 */
bool ck_YN(std::string, std::string, std::string);

/*! \brief decr_incr_datetime, handles decrease or increase the date-time item selected by the value of itm
 *  \ingroup rtc_paulsk
 *
 * \param bool dr (direction: previous/next or down/up)
 * \return None
 */
void decr_incr_datetime(bool);

/*! \brief elapsed time
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return uint8_t value of the elapsed time in seconds(i.e.: current unix_time - Ut (the initial unix_time))
 */
int elapsedtime();

/*! \brief fail_msgs, functio called by setup() displays failures
 *  \ingroup rtc_paulsk
 *
 * \param uint8_t code
 * \return None
 */
void fail_msgs(uint8_t);

/*! \brief get_alarm, set/get alarm. ToDo !
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return bool
 */
void get_alarm();

/*! \brief get_datetime, updates the rtc's _time array, fills the app_time vector array and prints "datetime saved" to terminal and to the display
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return None
 */
void get_datetime();

/*! \brief hexify, (See note at typedef buffer above.
 *  \ingroup rtc_paulsk
 *
 * \param vector of char
 * \return string
 */
hexbuffer hexify(const buffer&);

/*! \brief hsv_to_rgb, calculates the rgb value for the display print commands
 *  \ingroup rtc_paulsk
 *
 * \param pointer to structure rgb_t
 * \return structure rgb_t
 */
rgb_t hsv_to_rgb(rgb_t*);

/*! \brief led_toggle, toggles the built-in led On/Off. It reads and sets the global variable ledIsOn
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return None
 */
void led_toggle();

/*! \brief my_rgb, does certain calculations for randomazing screen color
 *  \ingroup rtc_paulsk
 *
 * \param uint8_t rgb_h, an integer value
 * \return None
 */
void my_rgb(int);

/*! \brief not_yet, prints a text to the display
 *  \ingroup rtc_paulsk
 *
 * \param bool lDsp, to display or not
 * \return None
 */
void not_yet(bool);

/*! \brief pass function, a trial to havean equivalent functionality to Python's pass
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return bool
 */
bool pass();

/*! \brief pr_in_which_menu, prints to terminal info about in which menu layer the app is
 *  \ingroup rtc_paulsk
 *
 * \param None, the direction of movement: if False: previous, if True: next
 * \return None
 */
void pr_in_which_menu();

/*! \brief pr_itemsel, prints to REPL and to the display the item selected
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return None
 */
void pr_itmsel();

/*! \brief prep_datetime(), prepares a std::vector with date and time elements to be displayed from withing doit()
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return std::vector<string>
 */
std::vector<std::string> prep_datetime();

/*! \brief reset_clk, reset the clock to date '2021-05-01 Sunday (=6) 12:00:00
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return boolean
 */
bool reset_clk();

/*! \brief rst_itm, checks the number of seconds that passed since the last visit to btn_xy_itm() function (used to control itm. If longer than 30 secs then reset itm to ITM_HELP value
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return boolean
 */
bool reset_itm();

/*! \brief rest_fm_EP(), restores certain data from User EEPROM to this app.
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return int. (0 when OK. -1 when retrieve of LED data failed; -2 when retrieve of back-/foreground colour data failed)
 */
int rest_fm_EP();

/*! \brief set_12_24, choose clock 12 hour (with AM/PM) or 24 hour mode
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return boolean
 */
bool set_12_24();

/*! \brief set_alarm, sets an alarm
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return boolean
 */
bool set_alarm();

/*! \brief set_background, sets lcd background or foreground colour, depending on param
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return None
 */
void set_background();

/*! \brief set_BackupSwitchoverMode, set the rtc backup switchover mode on/off
 *  \ingroup rtc_paulsk
 *
 * \param int mode 0 = switchover disabled, 1 = direct switching mode, 2 = standby mode, 3 = level switching mode (default)
 * \return None
 */
void set_BackupSwitchoverhMode(int);

/*! \brief set_blink, choose if built-in LED has to blink or not
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return None
 */
void set_blink();

/*! \brief set_datetime, updates the rtc's datetime, when the t_chgd flag is True
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return boolean
 */
bool set_datetime();

/*! \brief set_DispColour, clears the display in a colour defined by the value of param disp_colour if 3rd param is true. Set the background or the foreground colour depending 1st param
 *  \ingroup rtc_paulsk
 *
 * \param bool  bf, background (true) or foreground (false)
 * \param int Colour
 * \param bool cleardisp, clear the lcd if true (used for clearing the lcd to the background color)
 * \return None
 */
void set_DispColour(bool, int, bool);

/*! \brief set_foreground, sets lcd background or foreground colour, depending on param
 *  \ingroup rtc_paulsk
 *
 * \param bool
 * \return None
 */
void set_foreground();

/*! \brief set_timer, sets a timer
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return boolean
 */
bool set_timer();

/*! \brief setup, does initiation of the rtc among other things
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return boolean
 */
bool setup();

/*! \brief upd_app_time, updates the app_time array with clock data. Return is true
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return None
 */
void upd_app_time();

/*! \brief USBpwr(), returns true if the RPi Pico is powered from USB, false if not
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return boolean
 */
bool USBpwr();

/*! \brief w_btn
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return uint8_t what button was pressed (0~3)
 */
int w_btn();

/*! \brief z_main_loop, the main function loop of the app
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return None
 */
void z_main_loop();

/*! \brief main, the main function of this app
 *  \ingroup rtc_paulsk
 *
 * \param None
 * \return integer 
 */
int main();
/*
#ifdef __cplusplus
}
#endif
*/
#endif  // end-of _RTC_PSK_NEW_HPP