# LACHENAL_Lab2 : Let's count stuff

## Introduction

Ce TP permet d'appronfondir les bases de co-design vu précédemment. L'objectif de ce TP est d'implémenter un compteur avec 3 afficheurs 7 segments en utilisant un timer sur un FPGA FPGA Altera MAX 10 10M50DAF484C7G et la carte DE10 Lite.

## Architecture du systeme

L'architecture du système est toujours composé d'un processeur NIOS II, d'un JTAG UART pour faire du debogage à l'aide du terminal, d'une mémoire de 40 Ko, de 3 PIO en sortie de largeur 4 bits et d'un timer.

Voici l'architecture : 

![Architecture](Architecture.PNG)

En plus du Qsys, l'afficheur 7 segments à été rajouté en vhdl ce qui permettra de brancher les PIO en entrée sur 4 bits et de sortir sur l'afficheur sur 7 bits.

La gestion des centaines, dizaines et unité est gérer directement dans le programme C puis envoyé sur les 7 segments correspondant.

## Résultats

Le compteur qui est composé de 3 afficheurs 7 segments compte jusqu'a 999 en décimale. Le compteur est incrémenté a chaque interruption crée par le timer (à chaque seconde).

## Conclusion

Ce TP m'as permis de comprendre la gestion des interruptions avec un timer et l'implémentation d'un afficheur 7 segments en VHDL. 
Cela m'as aussi permis de voir la simplicité du codesign pour la partie BCD sans avoir à faire un DoubleDabble en VHDL.

