# Title: Programming Project Part 1		#Filename: SumLoop.asm
# Author: Joseph Lyons				    #Date: February 15th, 2017
# Description: Program accepts numbers from user and adds them together, terminates at input of 0
# Input: User enter numbers
# Output: Sum of numbers entered
################# Data segment #####################
.data

inputString:  .asciiz "Input a number: "
outputString:  .asciiz "Total sum of numbers: "
################# Code segment #####################
.text
.globl main

main:
      add  $s1, $zero, $zero  # Initialize $s1 to zero - reserved for our total sum

Loop: li   $v0, 4             # Load system call to print input string
      la   $a0, inputString   # Load input string for printing
      syscall
    
      li   $v0, 5             # Load system call to read number from user
      syscall
    
      add  $s1, $s1, $v0      # Add number to total sum
      bne  $v0, $zero, Loop   # Loop if last number wasn't 0
      
      li   $v0, 4             # Load system call to print output string
      la   $a0, outputString  # Load output string for printing
      syscall
      
      li   $v0, 1             # Load system call to print string
      add  $a0, $s1, $zero    # Load sum into $a0 for printing
      syscall