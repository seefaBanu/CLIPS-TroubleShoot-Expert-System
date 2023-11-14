;;;*********************************
;;;LAPTOP TROUBLESHOOT EXPERT SYSTEM
;;;*********************************
;;; Name - Banu A.G.S
;;; Index No - 204018X
;;;********************************

;;;;;***********
;;;;;QUERY RULES
;;;;;***********

;;;Starting greeting note and 
;;;rule to get user laptop power on or not

(defrule MAIN::start
  =>
  (printout t "Welcome to Laptop Troubleshoot expert System. Let's Get started" crlf)
  (printout t "*****" crlf)
  (printout t "" crlf)
  (printout t "Does the laptop power on? (Yes/No) ")
  (bind ?response (lowcase (read)))
  (if (eq ?response yes)
      then
      (assert (troubleshoot display))
      else
      (assert (troubleshoot power))
))


;;;This rule Checks whether the cables are connected properly

(defrule power
  (troubleshoot power )
  =>
  (printout t "Do the power cables connected properly? (Yes/No) " crlf)
  (bind ?response (lowcase (read)))
  (if (eq ?response yes)
      then
      (assert (troubleshoot power-connection))
      else
      (assert (issue cable-connectivity))
))

;;;This rule Checks whether the heat comes after cables connected , if so it means that battery is fine
;;;there might be issue in the power button 

(defrule power-connection
  (troubleshoot power-connection)
  =>
  (printout t "Does the laptop getting heat? (Yes/No) ")
  (bind ?response (lowcase (read)))
  (if (eq ?response yes)
      then
      (assert (troubleshoot power-button))
      else
      (assert (issue battery-or-power-adapter))
))

;;;This rule Checks the power button functionality . if there are no functionality of power button is visible then its 
;;; a power button issue. if not its a cmos issue

(defrule power-button
  (troubleshoot power-button)
  =>
  (printout t "Does the power button functional? (Yes/No) ")
  (bind ?response (lowcase (read)))
  (if (eq ?response yes)
      then
      (assert (issue cmos))
      else
      (assert (issue power-button))
))

;;;This rule Checks whether the display shows anything. if its working fine then user can log. or else the issue is related to
;;; screen

(defrule display
  (troubleshoot display )
  =>
  (printout t "Does the laptop display anything on the screen? (Yes/No) ")
  (bind ?response (lowcase (read)))
  (if (eq ?response yes)
      then
      (assert (troubleshoot log-and-use))
      else
      (assert (troubleshoot connect-external-monitor))
))


;;;This rule checks whether user can log in to the system . if not system have to consider error messages
(defrule log-and-use
  (troubleshoot log-and-use)
  =>
  (printout t "Can you log and use the laptop? (Yes/No) ")
  (bind ?response (lowcase (read)))
  (if (eq ?response yes)
      then
      (assert (troubleshoot performance-lag))
      else
      (assert (troubleshoot error-message))
))

;;;This rule Checks whether there is performace lag in the system
(defrule performance-lag
  (troubleshoot performance-lag)
  =>
  (printout t "Does yor laptop performance is slow and lagging ? (Yes/No) ")
  (bind ?response (lowcase (read)))
  (if (eq ?response yes)
      then
      (assert (issue upgrade-ram))
      else
      (assert (troubleshoot connectivity-and-software))
))

;;;This rule Checks whether there is any issue in the network connectivity or softwwre.
(defrule connectivity-and-software
  (troubleshoot connectivity-and-software)
  =>
  (printout t "Does your laptop has issues with network connectivity or software? (Yes/No) ")
  (bind ?response (lowcase (read)))
  (if (eq ?response yes)
      then
      (assert (issue network-driver))
      else
      (assert (issue none))
))

;;;This rule checks whether there are any error message show when user trying to loging in
(defrule error-message
  (troubleshoot error-message)
  =>
  (printout t "Does your laptop has any unusal error messages? (Yes/No) ")
  (bind ?response (lowcase (read)))
  (if (eq ?response yes)
      then
      (assert (issue follow-trouble-shoot-steps))
      else
      (assert (issue hardware))
))

;;; This rule Checks whether the display is working fine when its connected to external monitor
(defrule connect-external-monitor
  (troubleshoot connect-external-monitor)
  =>
  (printout t "Connected the system with external monitor and is it working? (Yes/No) ")
  (bind ?response (lowcase (read)))
  (if (eq ?response yes)
      then
      (assert (issue display))
      else
      (assert (issue graphics-card))
))

;;;;;*****************
;;;;; CONCLUSION RULES
;;;;;*****************

;;; This rule conclude and print that the powercables have to be connected to the system.
  (defrule issue-1-cable-connectivity
  (issue cable-connectivity)
  =>
  (printout t "********" crlf)
  (printout t "Connect all your power cables properly and try again with trouble shoot if the problem continues" crlf)
  (printout t " " crlf)
  (halt)
  )
  
  
;;; This rule conclude and print that the issue is with the power button.
  (defrule issue-2-power-button
  (issue power-button)
  =>
  (printout t "********" crlf)
  (printout t "There is an issue with your power button." crlf)
  (printout t " " crlf)
  (halt)
  )

;;; This rule conclude and print that the issue is with the cmos.
  (defrule issue-3-cmos
  (issue cmos)
  =>
  (printout t "********" crlf)
  (printout t "There is an issue with your power button." crlf)
  (printout t " " crlf)
  (halt)
  )
  
;;; This rule conclude and print that the issue is with the battery and power adpater . 
  (defrule issue-4-battery-or-power-adapter
  (issue battery-or-power-adapter)
  =>
  (printout t "********" crlf)
  (printout t "There is an issue with your battery or power adapter." crlf)
  (printout t " " crlf)
  (halt)
  )
  
  
;;; This rule conclude and print that the issue is with the RAM . upgrading ram could solve the problem.  
  (defrule issue-5-upgrade-ram
  (issue upgrade-ram)
  =>
  (printout t "********" crlf)
  (printout t "There is an issue with your RAM,Harrdrive.Try upgrading them." crlf)
  (printout t " " crlf)
  (halt)
  )

;;; This rule conclude and print that the issue is with the network driver.  
  (defrule issue-6-network-driver
  (issue network-driver)
  =>
  (printout t "********" crlf)
  (printout t "There is an issue with your network driver." crlf)
  (printout t " " crlf)
  (halt)
  
  )

;;; This rule conclude and print that there is no issue in the laptopm .  
  (defrule issue-7-none
  (issue none)
  =>
  (printout t "********" crlf)
  (printout t "There is no issue with your laptop. " crlf)
  (printout t " " crlf)
  (halt)
  )
 
;;; This rule conclude and print that following the trouble shoot steps could solve the problem .  
  (defrule issue-8-follow-trouble-shoot-steps
  (issue follow-trouble-shoot-steps)
  =>
  (printout t "********" crlf)
  (printout t "There is no issue with hardware just folow the troubleshoot steps shown in the screen. " crlf)
  (printout t " " crlf)
  (halt)
  )
  
;;; This rule conclude and print that the issue is with the hardware.  
  (defrule issue-9-hardware
  (issue hardware)
  =>
  (printout t "********" crlf)
  (printout t "There might be a hardware(RAM,HardDrive) issue on Your laptop. " crlf)
  (printout t " " crlf)
  (halt)
  )
  
;;; This rule conclude and print that the issue is with the display.  
  (defrule issue-10-display
  (issue display)
  =>
  (printout t "********" crlf)
  (printout t "There is an issue with the display of your laptop. " crlf)
  (printout t " " crlf)
  (halt)
  )
  
;;; This rule conclude and print that the issue is with the graphic card.  
  (defrule issue-11-graphic-card
  (issue graphics-card)
  =>
  (printout t "********" crlf)
  (printout t "There is an issue with the graphic card of your laptop." crlf)
  (printout t " " crlf)
  (halt)
  )
