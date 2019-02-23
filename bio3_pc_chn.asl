state("Bio3_PC")
{
        uint hp : "Bio3_PC.exe", 0x6FFC00;
	uint save : "Bio3_PC.exe", 0x6FF884;
	uint total : "Bio3_PC.exe", 0x704E98;
	uint current : "Bio3_PC.exe", 0x13706C, 0x5ac;
	uint game_state : "Bio3_PC.exe", 0x6FF7C0;
        ushort player_X : "Bio3_PC.exe", 0x65BDC8;
        byte room_ID : "Bio3_PC.exe", 0x704EE8;
        byte old_room : "Bio3_PC.exe", 0x704EEC;
        byte cam_ID : "Bio3_PC.exe", 0x704EEA;
        byte old_cam : "Bio3_PC.exe", 0x704EEE;
        byte stage_ID : "Bio3_PC.exe", 0x704EED;
	byte old_stage : "Bio3_PC.exe", 0x6E7F95;

	

}

isLoading
{
    return true;
}


start
{
   if(current.room_ID == 13 && current.cam_ID == 11) {
	  return (current.game_state & 0x8000000) == 0x8000000;
   }
   return false;
}



gameTime
{
	if((current.game_state & 0x4000) == 0x4000) {
		return TimeSpan.FromSeconds((current.total) / 60.0);
	} else {
		return TimeSpan.FromSeconds((current.current - current.save + current.total) / 60.0);
	}
}



reset
{
  return current.hp == 65516 || current.old_room == 0xFF || current.old_cam == 0xFF;
}


split
{
   const byte Magnum = 0x05;
   const byte Grenade_Launcher = 0x06;
   
   const byte Battery = 0x31;
   const byte Fire_Hook = 0x32;
   const byte Power_Cable = 0x33;
   const byte Fuse = 0x34;
   const byte Oil_Add = 0x36;
   const byte Machine_Oil = 0x39;
   const byte Mixed_Oil = 0x3A;
   const byte Wrench = 0x3C;
   const byte Fire_Hose = 0x3F;
   const byte Lighter_Oil = 0x41;
   const byte Green_Gem = 0x44;
   const byte Blue_Gem = 0x45;
   const byte Amber_Ball = 0x46;
   const byte Obsidian_Ball = 0x47;
   const byte Crystal_Ball =  0x48;
   const byte Gold_Gear = 0x4C;
   const byte Silver_Gear = 0x4D;
   const byte Chronos_Gear = 0x4E;
   const byte Bronze_Book = 0x4F;
   const byte Bronze_Compass = 0x50;
   const byte Vacc_Med = 0x51;
   const byte Vacc_Base = 0x52;
   const byte Vaccine = 0x55;
   const byte Med_Base = 0x58;
   const byte Water_Sample = 0x6F;
   const byte MO_Disk = 0x70;   
   const byte Lockpick = 0x72;
   const byte Warehouse_Key = 0x73;
   const byte Sickroom_Key = 0x74;
   const byte Stars_Key = 0x75;  
   const byte Chronos_Key = 0x79;
   const byte Facility_Key00 = 0x7E;
   const byte Facility_Key01 = 0x7F;
   const byte Boutique_Key = 0x80;
   const byte Chemical_Key = 0x60;

   var cur_seg = timer.CurrentSplitIndex + 1;

if(cur_seg <= 113) {

if(cur_seg == 1) {
	return (current.room_ID == 1); 
} else if(cur_seg == 2) {
	return (current.room_ID == 0);
} else if(cur_seg == 3) {
	return (current.room_ID == 1);
} else if(cur_seg == 4) {
	return (current.room_ID == 2);
} else if(cur_seg == 5) {
	return (current.room_ID == 3);
} else if(cur_seg == 6) {
	return (current.room_ID == 4);
} else if(cur_seg == 7) {
	return (current.room_ID == 6);
}
	// BASEMENT
else if(cur_seg == 8) {
	return (current.room_ID == 5);
} else if(cur_seg == 9) {
	return (current.room_ID == 7);
} else if(cur_seg == 10) {
	return (current.room_ID == 5);
} else if(cur_seg == 11) {
	return (current.room_ID == 8);
} else if(cur_seg == 12) {
	return (current.room_ID == 9);
} else if(cur_seg == 13) {
	return (current.room_ID == 10);
} else if(cur_seg == 14) {
	return (current.room_ID == 16);
}
	//RPD GATES
else if(cur_seg == 15) {
	return (current.room_ID == 17);
} else if(cur_seg == 16) {
	return (current.room_ID == 18);
} else if(cur_seg == 17) {
	return (current.room_ID == 19);
} else if(cur_seg == 18) {
	return (current.room_ID == 20);
} else if(cur_seg == 19) {
	return (current.room_ID == 24);
} else if(cur_seg == 20) {
	return (current.room_ID == 25);
} else if(cur_seg == 21) {
	return (current.room_ID == 26);
} 
	//STARS OFFICE
else if(cur_seg == 22) {
	return (current.room_ID == 25);
} else if(cur_seg == 23) {
	return (current.room_ID == 24);
} else if(cur_seg == 24) {
	return (current.room_ID == 20);
} else if(cur_seg == 25) {
	return (current.room_ID == 19);
} else if(cur_seg == 26) {
	return (current.room_ID == 18);
} else if(cur_seg == 27) {
	return (current.room_ID == 17);
} else if(cur_seg == 28) {
	return (current.room_ID == 37);
} else if(cur_seg == 29) {
	return (current.room_ID == 36);
}
	//RPD EXIT
else if(cur_seg == 30) {
	return (current.room_ID == 26);
} else if(cur_seg == 31) {
	return (current.room_ID == 24);
} else if(cur_seg == 32) {
	return (current.room_ID == 0);
} else if(cur_seg == 33) {
	return (current.room_ID == 1);
} else if(cur_seg == 34) {
	return (current.room_ID == 27);
} else if(cur_seg == 35) {
	return (current.room_ID == 2);
} else if(cur_seg == 36) {
	return (current.room_ID == 3);
} else if(cur_seg == 37) {
	return (current.room_ID == 5);
} else if(cur_seg == 38) {
	return (current.room_ID == 6);
} else if(cur_seg == 39) {
	return (current.room_ID == 17);
} else if(cur_seg == 40) {
	return (current.room_ID == 18);
} else if(cur_seg == 41) {
	return (current.room_ID == 6);
}
	//RESTAURANT 
else if(cur_seg == 42) {
	return (current.room_ID == 7);
} else if(cur_seg == 43) {
	return (current.room_ID == 16);
} else if(cur_seg == 44) {
	return (current.room_ID == 15);
} else if(cur_seg == 45) {
	return (current.room_ID == 16);
} else if(cur_seg == 46) {
	return (current.room_ID == 7);
} else if(cur_seg == 47) {
	return (current.room_ID == 8);
}
	//CITY HALL GATES
else if(cur_seg == 48) {
	return (current.room_ID == 9);
} else if(cur_seg == 49) {
	return (current.room_ID == 10);
} else if(cur_seg == 50) {
	return (current.room_ID == 11);
} else if(cur_seg == 51) {
	return (current.room_ID == 12);
} else if(cur_seg == 52) {
	return (current.old_room == 12);
} else if(cur_seg == 53) {
	return (current.room_ID == 11);
} else if(cur_seg == 54) {
	return (current.room_ID == 10);
} else if(cur_seg == 55) {
	return (current.room_ID == 9);
} else if(cur_seg == 56) {
	return (current.room_ID == 8);
} else if(cur_seg == 57) {
	return (current.room_ID == 7);
}
	//BOOK
else if(cur_seg == 58) {
	return (current.room_ID == 6);
} else if(cur_seg == 59) {
	return (current.room_ID == 5);
} else if(cur_seg == 60) {
	return (current.room_ID == 6);
} else if(cur_seg == 61) {
	return (current.room_ID == 7);
} else if(cur_seg == 62) {
	return (current.room_ID == 8);
} else if(cur_seg == 63) {
	return (current.room_ID == 7);
} 
	//BATTERY
else if(cur_seg == 64) {
	return (current.room_ID == 6);
} else if(cur_seg == 65) {
	return (current.room_ID == 5);
} else if(cur_seg == 66) {
	return (current.room_ID == 3);
} else if(cur_seg == 67) {
	return (current.room_ID == 4);
} else if(cur_seg == 68) {
	return (current.room_ID == 19);
} else if(cur_seg == 69) {
	return (current.room_ID == 20);
} else if(cur_seg == 70) {
	return (current.room_ID == 4);
} else if(cur_seg == 71) {
	return (current.room_ID == 3);
} 
	// FUSE AREA
else if(cur_seg == 72) {
	return (current.room_ID == 2);
} else if(cur_seg == 73) {
	return (current.room_ID == 27);
} else if(cur_seg == 74) {
	return (current.room_ID == 1);
} else if(cur_seg == 75) {
	return (current.room_ID == 0);
} else if(cur_seg == 76) {
	return (current.room_ID == 24);
} else if(cur_seg == 77) {
	return (current.room_ID == 26);
} else if(cur_seg == 78) {
	return (current.room_ID == 36);
} else if(cur_seg == 79) {
	return (current.room_ID == 35);
} else if(cur_seg == 80) {
	return (current.room_ID == 14);
} else if(cur_seg == 81) {
	return (current.room_ID == 11);
} else if(cur_seg == 82) {
	return (current.room_ID == 27);
} else if(cur_seg == 83) {
	return (current.room_ID == 28);
} else if(cur_seg == 84) {
	return (current.room_ID == 27);
} else if(cur_seg == 85) {
	return (current.room_ID == 11);
} 
	//SALES OFFICE ESCAPE
else if(cur_seg == 86) {
	return (current.room_ID == 14);
} else if(cur_seg == 87) {
	return (current.room_ID == 35);
} else if(cur_seg == 88) {
	return (current.room_ID == 36);
} else if(cur_seg == 89) {
	return (current.room_ID == 26);
} else if(cur_seg == 90) {
	return (current.room_ID == 24);
} else if(cur_seg == 91) {
	return (current.room_ID == 0);
} else if(cur_seg == 92) {
	return (current.room_ID == 1);
} else if(cur_seg == 93) {
	return (current.room_ID == 27);
} else if(cur_seg == 94) {
	return (current.room_ID == 2);
} else if(cur_seg == 95) {
	return (current.room_ID == 3);
} else if(cur_seg == 96) {
	return (current.room_ID == 5);
} else if(cur_seg == 97) {
	return (current.room_ID == 6);
} else if(cur_seg == 98) {
	return (current.room_ID == 22);
} else if(cur_seg == 99) {
	return (current.room_ID == 6);
} else if(cur_seg == 100) {
	return (current.room_ID == 7);
} else if(cur_seg == 101) {
	return (current.room_ID == 8);
} else if(cur_seg == 102) {
	return (current.room_ID == 14);
} else if(cur_seg == 103) {
	return (current.room_ID == 13);
} else if(cur_seg == 104) {
	return (current.room_ID == 23);
} else if(cur_seg == 105) {
	return (current.room_ID == 8);
} 
	//GAS STATION ESCAPE
else if(cur_seg == 106) {
	return (current.room_ID == 9);
} else if(cur_seg == 107) {
	return (current.room_ID == 10);
} else if(cur_seg == 108) {
	return (current.room_ID == 11);
} else if(cur_seg == 109) {
	return (current.room_ID == 12);
} else if(cur_seg == 110) {
	return (current.old_room == 12);
} else if(cur_seg == 111) {
	return (current.room_ID == 21);
} else if(cur_seg == 112) {
	return (current.old_room == 21);
} else if(cur_seg == 113) {
	return (current.room_ID == 5);
} 
	//TRAIN CRASH
}

cur_seg += 6;
if(cur_seg <= 151) {

if(cur_seg == 120) {
	return (current.room_ID == 1 && current.old_room == 0);
} else if(cur_seg == 121) {
	return (current.room_ID == 2);
} else if(cur_seg == 122) {
	return (current.room_ID == 4);
} else if(cur_seg == 123) {
	return (current.room_ID == 10);
} else if(cur_seg == 124) {
	return (current.room_ID == 11);
} else if(cur_seg == 125) {
	return (current.room_ID == 12);
} else if(cur_seg == 126) {
	return (current.room_ID == 11);
} else if(cur_seg == 127) {
	return (current.room_ID == 10);
} else if(cur_seg == 128) {
	return (current.room_ID == 4);
} else if(cur_seg == 129) {
	return (current.room_ID == 7);
} else if(cur_seg == 130) {
	return (current.room_ID == 8);
} 
	//CHRONOS KEY
else if(cur_seg == 131) {
	return (current.room_ID == 9);
} else if(cur_seg == 132) {
	return (current.room_ID == 8);
} else if(cur_seg == 133) {
	return (current.room_ID == 7);
} else if(cur_seg == 134) {
	return (current.room_ID == 4);
} else if(cur_seg == 135) {
	return (current.room_ID == 10);
} else if(cur_seg == 136) {
	return (current.room_ID == 11);
} else if(cur_seg == 137) {
	return (current.room_ID == 12);
} else if(cur_seg == 138) {
	return (current.room_ID == 11);
} else if(cur_seg == 139) {
	return (current.room_ID == 13);
} else if(cur_seg == 140) {
	return (current.room_ID == 16);
} 
	//NEMESIS
else if(cur_seg == 141) {
	return (current.room_ID == 23);
} else if(cur_seg == 142) {
	return (current.old_room == 23);
} else if(cur_seg == 143) {
	return (current.room_ID == 22);
} else if(cur_seg == 144) {
	return (current.room_ID == 19);
} else if(cur_seg == 145) {
	return (current.room_ID == 20);
} else if(cur_seg == 146) {
	return (current.room_ID == 21);
} else if(cur_seg == 147) {
	return (current.room_ID == 23);
} else if(cur_seg == 148) {
	return (current.room_ID == 2);
} else if(cur_seg == 149) {
	return (current.room_ID == 3);
} else if(cur_seg == 150) {
	return (current.room_ID == 4);
} else if(cur_seg == 151) {
	return (current.old_room == 4); 
}

}

cur_seg += 10;

if(cur_seg == 162) {
	return (current.room_ID == 3);
} else if(cur_seg == 163) {
	return (current.room_ID == 2);
} else if(cur_seg == 164) {
	return (current.room_ID == 23);
} else if(cur_seg == 165) {
	return (current.room_ID == 21);
} else if(cur_seg == 166) {
	return (current.room_ID == 20);
} else if(cur_seg == 167) {
	return (current.room_ID == 19);
} else if(cur_seg == 168) {
	return (current.room_ID == 22);
} else if(cur_seg == 169) {
	return (current.room_ID == 23);
} else if(cur_seg == 170) {
	return (current.old_room == 23);
} else if(cur_seg == 171) {
	return (current.room_ID == 16);
} else if(cur_seg == 172) {
	return (current.room_ID == 0);
} 
	//JILL SAVED
else if(cur_seg == 173) {
	return (current.room_ID == 15);
} else if(cur_seg == 174) {
	return (current.room_ID == 14);
} else if(cur_seg == 175) {
	return (current.room_ID == 7);
} else if(cur_seg == 176) {
	return (current.room_ID == 8);
} else if(cur_seg == 177) {
	return (current.room_ID == 9);
} else if(cur_seg == 178) {
	return (current.room_ID == 0);
} else if(cur_seg == 179) {
	return (current.room_ID == 1);
} else if(cur_seg == 180) {
	return (current.room_ID == 0);
} else if(cur_seg == 181) {
	return (current.room_ID == 12);
} else if(cur_seg == 182) {
	return (current.room_ID == 14);
} else if(cur_seg == 183) {
	return (current.room_ID == 15);
} else if(cur_seg == 184) {
	return (current.room_ID == 14);
} else if(cur_seg == 185) {
	return (current.room_ID == 12);
} else if(cur_seg == 186) {
	return (current.room_ID == 13);
} else if(cur_seg == 187) {
	return (current.room_ID == 16);
} else if(cur_seg == 188) {
	return (current.room_ID == 17);
} else if(cur_seg == 189) {
	return (current.room_ID == 18);
} else if(cur_seg == 190) {
	return (current.room_ID == 20);
} else if(cur_seg == 191) {
	return (current.room_ID == 18);
} else if(cur_seg == 192) {
	return (current.room_ID == 21);
} else if(cur_seg == 193) {
	return (current.room_ID == 16);
} 
	//GRAVEDIGGER DEAD
else if(cur_seg == 194) {
	return (current.room_ID == 13);
} else if(cur_seg == 195) {
	return (current.room_ID == 12);
} else if(cur_seg == 196) {
	return (current.room_ID == 14);
} else if(cur_seg == 197) {
	return (current.room_ID == 15);
} else if(cur_seg == 198) {
	return (current.room_ID == 16);
} else if(cur_seg == 199) {
	return (current.room_ID == 0);
} else if(cur_seg == 200) {
	return (current.room_ID == 1);
} else if(cur_seg == 201) {
	return (current.room_ID == 2);
} else if(cur_seg == 202) {
	return (current.room_ID == 1);
} else if(cur_seg == 203) {
	return (current.room_ID == 0);
} else if(cur_seg == 204) {
	return (current.room_ID == 3);
} else if(cur_seg == 205) {
	return (current.room_ID == 3 && current.old_room == 3);
} else if(cur_seg == 206) {
	return (current.room_ID == 7);
} else if(cur_seg == 207) {
	return (current.room_ID == 4);
} else if(cur_seg == 208) {
	return (current.room_ID == 5);
} else if(cur_seg == 209) {
	return (current.room_ID == 6);
} else if(cur_seg == 210) {
	return (current.room_ID == 5);
} 
	//WATER PUZZLE
else if(cur_seg == 211) {
	return (current.room_ID == 4);
} else if(cur_seg == 212) {
	return (current.room_ID == 7);
} else if(cur_seg == 213) {
	return (current.room_ID == 3);
} else if(cur_seg == 214) {
	return (current.old_room == 3);
} else if(cur_seg == 215) {
	return (current.room_ID == 8);
} else if(cur_seg == 216) {
	return (current.room_ID == 9);
} else if(cur_seg == 217) {
	return (current.room_ID == 8);
} 
	//TREATMENT ROOM
else if(cur_seg == 218) {
	return (current.room_ID == 3);
} else if(cur_seg == 219) {
	return (current.room_ID == 0);
} else if(cur_seg == 220) {
	return (current.room_ID == 10);
} else if(cur_seg == 221) {
	return (current.room_ID == 11);
} else if(cur_seg == 222) {
	return (current.room_ID == 12);
} else if(cur_seg == 223) {
	return (current.room_ID == 13);
} else if(cur_seg == 224) {
	return (current.room_ID == 15);
} else if(cur_seg == 225) {
	return (current.room_ID == 14);
} else if(cur_seg == 226) {
	//return (current.game_state & 0x4000) == 0x4000;
	return false;
}

}
