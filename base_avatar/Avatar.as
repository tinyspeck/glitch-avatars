package  {
	
	import flash.display.BlendMode;
	import flash.display.FrameLabel;
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import flash.system.Security;
	import flash.utils.getQualifiedClassName;
	
	public class Avatar extends MovieClip {
		
		// these consts are for building asset names
		public const SHIRTTORSO:String = 'shirtTorso';
		public const SLEEVEUPPERCLOSE:String = 'sleeveUpperClose';
		public const SLEEVELOWERCLOSE:String = 'sleeveLowerClose';
		public const SLEEVEUPPEROFFSIDE:String = 'sleeveUpperOffside';
		public const SLEEVELOWEROFFSIDE:String = 'sleeveLowerOffside';
		
		public const COATCLOSE:String = 'coatClose';
		public const COATOFFSIDE:String = 'coatOffside';
		public const COATSLEEVEUPPERCLOSE:String = 'coatSleeveUpperClose';
		public const COATSLEEVELOWERCLOSE:String = 'coatSleeveLowerClose';
		public const COATSLEEVEUPPEROFFSIDE:String = 'coatSleeveUpperOffside';
		public const COATSLEEVELOWEROFFSIDE:String = 'coatSleeveLowerOffside';
		
		public const PANTSTOP:String = 'pantsTop';
		public const PANTSLEGUPPERCLOSE:String = 'pantsLegUpperClose';
		public const PANTSLEGLOWERCLOSE:String = 'pantsLegLowerClose';
		public const PANTSLEGUPPEROFFSIDE:String = 'pantsLegUpperOffside';
		public const PANTSLEGLOWEROFFSIDE:String = 'pantsLegLowerOffside';
		public const DRESS:String = 'dress';
		public const SKIRT:String = 'skirt';
		public const SOCKCLOSE:String = 'sockClose';
		public const SOCKOFFSIDE:String = 'sockOffside';
		public const SHOECLOSE:String = 'shoeClose';
		public const SHOEOFFSIDE:String = 'shoeOffside';
		public const GLOVECLOSE:String = 'gloveClose';
		public const GLOVEOFFSIDE:String = 'gloveOffside';
		public const RING:String = 'ring';
		public const NECKLACE:String = 'necklace';
		public const CAPE:String = 'cape';
		public const CAPETIE:String = 'capeTie';
		public const BACKCAPE:String = 'backCape';
		public const BRACELETCLOSE:String = 'braceletClose';
		public const BACKBRACELETRIGHT:String = 'backBraceletRight';
		public const SIDENOSE:String = 'sideNose';
		public const SIDEEARCLOSE:String = 'sideEarClose';
		public const SIDEHAIR:String = 'sideHair';
		public const SIDEHAT:String = 'sideHat';
		public const SIDEEYECLOSE:String = 'sideEyeClose';
		public const SIDEMOUTH:String = 'sideMouth';
		public const SIDEEYEOFFSIDE:String = 'sideEyeOffside';
		
		public const BACKSHIRTTORSO:String = 'backShirtTorso';
		public const BACKSLEEVEUPPERLEFT:String = 'backSleeveUpperLeft';
		public const BACKSLEEVELOWERLEFT:String = 'backSleeveLowerLeft';
		public const BACKSLEEVEUPPERRIGHT:String = 'backSleeveUpperRight';
		public const BACKSLEEVELOWERRIGHT:String = 'backSleeveLowerRight';
		
		public const BACKCOAT:String = 'backCoat';
		public const BACKCOATSLEEVEUPPERLEFT:String = 'backCoatSleeveUpperLeft';
		public const BACKCOATSLEEVELOWERLEFT:String = 'backCoatSleeveLowerLeft';
		public const BACKCOATSLEEVEUPPERRIGHT:String = 'backCoatSleeveUpperRight';
		public const BACKCOATSLEEVELOWERRIGHT:String = 'backCoatSleeveLowerRight';
		
		public const BACKPANTSTOP:String = 'backPantsTop';
		public const BACKPANTSLEGUPPERLEFT:String = 'backPantsLegUpperLeft';
		public const BACKPANTSLEGLOWERLEFT:String = 'backPantsLegLowerLeft';
		public const BACKPANTSLEGUPPERRIGHT:String = 'backPantsLegUpperRight';
		public const BACKPANTSLEGLOWERRIGHT:String = 'backPantsLegLowerRight';
		public const BACKDRESS:String = 'backDress';
		public const BACKSKIRT:String = 'backSkirt';
		
		public const BACKSHOELEFT:String = 'backShoeLeft';
		public const BACKSHOERIGHT:String = 'backShoeRight';
		
		public const BACKHAIR:String = 'backHair';
		public const BACKHAT:String = 'backHat';
		public const BACKEARS:String = 'backEars';
		
		public var avatar:MovieClip;
		public var animations:Array = [];
		
		private var console:* = null;
		
		private var asset_provider:MovieClip;
		
		// below are for referncing the assets in use which are placed into the containers, only the ones which we will animate or allow custom placement/sizing
		private var eye_close:MovieClip;
		private var eye_offside:MovieClip;
		private var hat:MovieClip;
		private var back_hat:MovieClip;
		private var hair:MovieClip;
		private var back_hair:MovieClip;
		private var mouth:MovieClip;
		private var skirt:MovieClip;
		private var back_skirt:MovieClip;
		private var dress:MovieClip;
		private var back_dress:MovieClip;
		private var cape:MovieClip;
		private var back_cape:MovieClip;
		private var nose:MovieClip;
		private var ear_close:MovieClip;
		private var back_ears:MovieClip;
		
		// below are the clips we use to provide color
		private var skull_color:MovieClip;
		private var torso_color:MovieClip;
		private var arm_upper_close_color:MovieClip;
		private var arm_upper_offside_color:MovieClip;
		private var arm_lower_close_color:MovieClip;
		private var arm_lower_offside_color:MovieClip;
		private var hand_close_color:MovieClip;
		private var hand_offside_color:MovieClip;
		private var leg_upper_close_color:MovieClip;
		private var leg_upper_offside_color:MovieClip;
		private var leg_lower_close_color:MovieClip;
		private var leg_lower_offside_color:MovieClip;
		private var foot_close_color:MovieClip;
		private var foot_offside_color:MovieClip;
		private var back_skull_color:MovieClip;
		private var back_torso_color:MovieClip;
		private var back_arm_upper_left_color:MovieClip;
		private var back_arm_upper_right_color:MovieClip;
		private var back_arm_lower_left_color:MovieClip;
		private var back_arm_lower_right_color:MovieClip;
		private var back_hand_left_color:MovieClip;
		private var back_hand_right_color:MovieClip;
		private var back_leg_upper_left_color:MovieClip;
		private var back_leg_upper_right_color:MovieClip;
		private var back_leg_lower_left_color:MovieClip;
		private var back_leg_lower_right_color:MovieClip;
		private var back_foot_left_color:MovieClip;
		private var back_foot_right_color:MovieClip;
		private var ear_close_color:MovieClip;
		private var back_ears_color:MovieClip;
		private var back_hair_color:MovieClip;
		private var hair_color:MovieClip;
		
		// below are the masks we use for the face
		private var mouth_mask:MovieClip;
		private var eye_close_mask:MovieClip;
		private var eye_offside_mask:MovieClip;
		
		// below are for storing the initial positions of the face parts
		private var mouth_y:Number;
		private var nose_y:Number;
		private var ear_close_y:Number;
		//private var back_ears_y:Number; // this has problems and I am not sure it is needed
		private var eye_close_x:Number;
		private var eye_offside_x:Number;
		private var eye_close_y:Number;
		private var eye_offside_y:Number;
		
		// these are the dudes we need to animate:
		private var side_animated_mcs:Array = ['hat', 'hair', 'hair_color', 'skirt', 'dress', 'mouth', 'eye_offside', 'eye_close', 'cape'];
		private var back_animated_mcs:Array = ['back_hat', 'back_hair', 'back_hair_color', 'back_skirt', 'back_dress', 'back_cape'];
		
		public function Avatar() {
			Security.allowDomain('*');
			asset_provider = this;
			initAvatar();
		}
		
		private function initAvatar():void {
			avatar = avatarContainer_mc;
			Security.allowDomain('*');
			
			// build animations array
			var labels:Array = avatar.currentLabels;
			for (var i:uint = 0; i < labels.length; i++) {
				var label:FrameLabel = labels[i];
				if (label.name.indexOf('ignore') > -1) {
					trace("IGNORING frame " + label.frame + ": " + label.name);
				} else {
					trace("frame " + label.frame + ": " + label.name);
					animations.push(label.name);	
				}
			}
			
			//avatar.gotoAndStop(0); I think this is not nec.
			//setAssetProvider();
			
			var skull:MovieClip = avatarContainer_mc.sideHeadContainer_mc.sideSkullContainer_mc.sideSkull_mc;
			
			// do masking for face
			mouth_mask = new sideSkull();
			mouth_mask.x = skull.x;
			mouth_mask.y = skull.y;
			skull.parent.addChild(mouth_mask);
			
			eye_close_mask = new sideSkull();
			eye_close_mask.x = skull.x;
			eye_close_mask.y = skull.y;
			skull.parent.addChild(eye_close_mask);
			
			eye_offside_mask = new sideSkull();
			eye_offside_mask.x = skull.x;
			eye_offside_mask.y = skull.y;
			skull.parent.addChild(eye_offside_mask);
			
			mouth_y = avatarContainer_mc.sideHeadContainer_mc.sideMouthContainer_mc.y;
			nose_y = avatarContainer_mc.sideHeadContainer_mc.sideNoseContainer_mc.y;
			//back_ears_y = avatarContainer_mc.backEarsContainer_mc.y;
			ear_close_y = avatarContainer_mc.sideHeadContainer_mc.sideEarCloseContainer_mc.y;
			eye_close_x = avatarContainer_mc.sideHeadContainer_mc.sideEyeCloseContainer_mc.x;
			eye_offside_x = avatarContainer_mc.sideHeadContainer_mc.sideEyeOffsideContainer_mc.x;
			eye_close_y = avatarContainer_mc.sideHeadContainer_mc.sideEyeCloseContainer_mc.y;
			eye_offside_y = avatarContainer_mc.sideHeadContainer_mc.sideEyeOffsideContainer_mc.y;
			
			// for now
			//showDefault();
			/*initializeHead({
				"nose_scale"		: "1.002",
				"eyes"			: "01",
				"ears_height"		: "0",
				"nose_height"		: "-0.03",
				"hair"			: "none",
				"skin_tint_color"	: "D4C159",
				"hair_tint_color"	: "696969",
				"pants"			: "A011",
				"ears"			: "none",
				"mouth"			: "01",
				"eye_scale"		: "0.897",
				"shoes"			: "D011",
				"nose"			: "none",
				"eye_dist"		: "-1",
				"skirt"			: "none",
				"eye_height"		: "1.03",
				"shirt"			: "none",
				"dress"			: "none",
				"mouth_scale"		: "1.002",
				"mouth_height"		: "0",
				"ears_scale"		: "1.002",
				"necklace"		: "none",
				"ring"			: "none",
				"gloves"		: "none",
				"bracelet"		: "none",
				"hat"			: "Bear",
				"ver"			: "07.02.10"
			});			*/
		}
		
		private function makeColorMcsForBody():void {
			
			// color for the skull
			skull_color = makeColorMCForSkin(new sideSkull(), 'sideHeadContainer_mc', 'sideSkullContainer_mc', 'sideSkull_mc');
			
			// color for the torso
			torso_color = makeColorMCForSkin(new sideTorso(), 'sideTorsoContainer_mc', 'sideTorso_mc');
			
			// color for upper arms
			arm_upper_close_color = makeColorMCForSkin(new sideArmUpperClose(), 'sideArmUpperCloseContainer_mc', 'sideArmUpperClose_mc');
			arm_upper_offside_color = makeColorMCForSkin(new sideArmUpperOffside(), 'sideArmUpperOffsideContainer_mc', 'sideArmUpperOffside_mc');
			
			// color for lower harms
			arm_lower_close_color = makeColorMCForSkin(new sideArmLowerClose(), 'sideArmLowerCloseContainer_mc', 'sideArmLowerClose_mc');
			arm_lower_offside_color = makeColorMCForSkin(new sideArmLowerOffside(), 'sideArmLowerOffsideContainer_mc', 'sideArmLowerOffside_mc');
			
			// color for hands
			hand_close_color = makeColorMCForSkin(new sideHandClose(), 'sideHandCloseContainer_mc', 'sideHandClose_mc');
			hand_offside_color = makeColorMCForSkin(new sideHandOffside(), 'sideHandOffsideContainer_mc', 'sideHandOffside_mc');
			
			// color for upper legs
			leg_upper_close_color = makeColorMCForSkin(new sideLegUpperClose(), 'sideLegUpperCloseContainer_mc', 'sideLegUpperClose_mc');
			leg_upper_offside_color = makeColorMCForSkin(new sideLegUpperOffside(), 'sideLegUpperOffsideContainer_mc', 'sideLegUpperOffside_mc');
			
			// color for lower legs
			leg_lower_close_color = makeColorMCForSkin(new sideLegLowerClose(), 'sideLegLowerCloseContainer_mc', 'sideLegLowerClose_mc');
			leg_lower_offside_color = makeColorMCForSkin(new sideLegLowerOffside(), 'sideLegLowerOffsideContainer_mc', 'sideLegLowerOffside_mc');
			
			// color for feet
			foot_close_color = makeColorMCForSkin(new sideFootClose(), 'sideFootCloseContainer_mc', 'sideFootClose_mc');
			foot_offside_color = makeColorMCForSkin(new sideFootOffside(), 'sideFootOffsideContainer_mc', 'sideFootOffside_mc');
			
			
			// color for the skull
			back_skull_color = makeColorMCForSkin(new backHead(), 'backHeadContainer_mc', 'backHead_mc');
			
			// color for the torso
			back_torso_color = makeColorMCForSkin(new backTorso(), 'backTorsoContainer_mc', 'backTorso_mc');
			
			// color for upper arms
			back_arm_upper_left_color = makeColorMCForSkin(new backArmUpperLeft(), 'backArmUpperLeftContainer_mc', 'backArmUpperLeft_mc');
			back_arm_upper_right_color = makeColorMCForSkin(new backArmUpperRight(), 'backArmUpperRightContainer_mc', 'backArmUpperRight_mc');
			
			// color for lower harms
			back_arm_lower_left_color = makeColorMCForSkin(new backArmLowerLeft(), 'backArmLowerLeftContainer_mc', 'backArmLowerLeft_mc');
			back_arm_lower_right_color = makeColorMCForSkin(new backArmLowerRight(), 'backArmLowerRightContainer_mc', 'backArmLowerRight_mc');
			
			// color for hands
			back_hand_left_color = makeColorMCForSkin(new backHandLeft(), 'backHandLeftContainer_mc', 'backHandLeft_mc');
			back_hand_right_color = makeColorMCForSkin(new backHandRight(), 'backHandRightContainer_mc', 'backHandRight_mc');
			
			// color for upper legs
			back_leg_upper_left_color = makeColorMCForSkin(new backLegUpperLeft(), 'backLegUpperLeftContainer_mc', 'backLegUpperLeft_mc');
			back_leg_upper_right_color = makeColorMCForSkin(new backLegUpperRight(), 'backLegUpperRightContainer_mc', 'backLegUpperRight_mc');
			
			back_leg_lower_left_color = makeColorMCForSkin(new backLegLowerLeft(), 'backLegLowerLeftNakedContainer_mc', 'backLegLowerLeft_mc');
			back_leg_lower_right_color = makeColorMCForSkin(new backLegLowerRight(), 'backLegLowerRightNakedContainer_mc', 'backLegLowerRight_mc');
			
			// color for feet
			back_foot_left_color = makeColorMCForSkin(new backFootLeft(), 'backFootLeftContainer_mc', 'backFootLeft_mc');
			back_foot_right_color = makeColorMCForSkin(new backFootRight(), 'backFootRightContainer_mc', 'backFootRight_mc');
			
		}
		
		private function makeColorMCForSkin(color_mc:MovieClip, ... path):MovieClip {
			color_mc.name = getQualifiedClassName(color_mc)+'_color';
			var p:MovieClip = avatarContainer_mc;
			
			// make sure the whole path exists before doing anything
			for (var i:int;i<path.length;i++) {
				p = p[path[i]];
				if (!p) {
					warn(path[i]+' not exists');
					return null;
				}
			}
			
			// we do this check because we have to call makeColorMcsForBody on every initializeHead,
			// in order to get the back containers, which are fucked somehow, but we don't want to add extra color mcs
			if (p.parent.getChildByName(color_mc.name)) {
				//warn('already has '+getQualifiedClassName(color_mc))
				return p.parent.getChildByName(color_mc.name) as MovieClip;
			}
			
			color_mc.blendMode = BlendMode.HARDLIGHT;
			p.parent.addChild(color_mc);
			
			return color_mc;
		}
		
		private function info(v:*) {
			if (console && console.info) {
				console.info(v);
			} else {
				trace('INFO: '+v)
			}
		}
		
		private function warn(v:*) {
			if (console && console.warn) {
				console.warn(v);
			} else {
				trace('WARN: '+v)
			}
		}
		
		private function error(v:*) {
			if (console && console.error) {
				console.error(v);
			} else {
				trace('ERROR: '+v)
			}
		}
		
		private function log(pri:String, v:*) {
			if (console && console.log) {
				console.log(pri, v);
			} else {
				trace('LOG '+pri+': '+v)
			}
		}
		
		public function setConsole(console:*):void {
			this.console = console;
		}
		
		public function setAssetProvider(provider:MovieClip = null, get_all:Boolean = false):void {
			if (provider) asset_provider = provider;
			options.hair = getAllIdsWithPrefix(BACKHAIR, get_all);
			options.hat = getAllIdsWithPrefix(BACKHAT, get_all);
			options.nose = getAllIdsWithPrefix(SIDENOSE, get_all);
			options.mouth = getAllIdsWithPrefix(SIDEMOUTH, get_all);
			options.eyes = getAllIdsWithPrefix(SIDEEYECLOSE, get_all);
			options.ears = getAllIdsWithPrefix(SIDEEARCLOSE, get_all);
			options.shirt = getAllIdsWithPrefix(SHIRTTORSO, get_all);
			options.coat = getAllIdsWithPrefix(COATOFFSIDE, get_all);
			options.pants = getAllIdsWithPrefix(PANTSTOP, get_all);
			options.dress = getAllIdsWithPrefix(DRESS, get_all);
			options.skirt = getAllIdsWithPrefix(SKIRT, get_all);
			options.shoes = getAllIdsWithPrefix(SHOECLOSE, get_all);
			options.gloves = getAllIdsWithPrefix(GLOVECLOSE, get_all);
			options.ring = getAllIdsWithPrefix(RING, get_all);
			options.necklace = getAllIdsWithPrefix(NECKLACE, get_all);
			options.bracelet = getAllIdsWithPrefix(BRACELETCLOSE, get_all);
			options.cape = getAllIdsWithPrefix(BACKCAPE, get_all);
			/*
			// are these overwritten by configs when loaded?
			options.skin_tint_color = ['BFB4A0','D4C159','D48C08','E07E90','C49BC4','ACACAC','71b2ba','7FB8AB','93C28C','BD7DB0','669A9C','B36784']
				.concat('473a3a','5a4a4a','574f4a','633550','564a79','0980b2','1a6062','2c6862','005E70','156E60','206520','546310','711A1D','692f19','794F00','b17408','c7d0c0');
			options.hair_tint_color = ['BF6F7E','994B4B','5C4239','9A973A','339993','397545','5E9C68','578091','2D648C','6885AD','958AAA','696969']
				.concat('423737','714011','711950','443a33','333a44','554555','555545','355555','204024','003A49');*/
		}
		
		private function getAllIdsWithPrefix(prefix:String, get_all:Boolean = false):Array {
			var A:Array = ['none'];
			if (!asset_provider.hasOwnProperty('AvatarAssetsClasses')) return A;
			
			var classA:Array = asset_provider.AvatarAssetsClasses;
			for (var i:int; i<classA.length; i++) {
				if (classA[i].indexOf(prefix) == 0) {
					if (get_all || String(classA[i]).toLowerCase().indexOf('staff') == -1) {
						A.push(classA[i].replace(prefix, ''));
					}
				} 
			}
			
			return A;
		}
		
		public function playAnimation(anim:String):void {
			if (animations.indexOf(anim)>-1) {
				if (anim == 'climb') {
					playBackAnimation(anim);
				} else {
					playSideAnimation(anim);
				}
			} else {
				warn('playAnimation unkown animation: '+anim);
			}
		}
		
		public function gotoAndStopOnAnimatedParts(anim:String, fn:int):void {
			var i:int;
			// climb has a nested animation
			if (anim == 'climb') {
				for (i=0;i<back_animated_mcs.length;i++) {
					if (this[back_animated_mcs[i]]) this[back_animated_mcs[i]].gotoAndStop(fn);
				}
			} else {
				for (i=0;i<side_animated_mcs.length;i++) {
					if (this[side_animated_mcs[i]]) this[side_animated_mcs[i]].gotoAndStop(fn);
				}
			}
		}
		
		private function getColorTransform(color_str:String):ColorTransform {
			var color_num:Number = colorStrToNum(color_str);
			var rr:int = color_num >> 16 & 0xFF;
			var gg:int = color_num >> 8 & 0xFF;
			var bb:int = color_num & 0xFF;
			return new ColorTransform(0, 0, 0, 1, rr, gg, bb, 0);
		}
		
		// misnamed for legacy sake (it does the whole body, not just the head)
		public function initializeHead(hash:Object):void {
			if (hash.shirt == '01Staff') hash.shirt = '20101103Black1';

			addEyes(hash.eyes);
			addHat(hash.hat);
			addHair(hash.hair);
			addMouth(hash.mouth);
			addEars(hash.ears);
			addNose(hash.nose);
			addPants(hash.pants);
			
			if (hash.coat && hash.coat != 'none') {
				addShirt(hash.shirt);
				addCoat(hash.coat);
			} else {
				addCoat(hash.coat);
				addShirt(hash.shirt);
			}
			
			// skirt must be exclusive of dress
			if (hash.skirt && hash.skirt != 'none') {
				addDress('none');
				addSkirt(hash.skirt);
			} else {
				addSkirt('none');
				addDress(hash.dress);
			}
			
			addCape(hash.cape);
			addShoe(hash.shoes);
			addGlove(hash.gloves);
			addRing(hash.ring);
			addNecklace(hash.necklace);
			addBracelet(hash.bracelet);
			
			makeColorMcsForBody();
			var ct:ColorTransform;
			
			if (hash.hasOwnProperty('skin_tint_color')) {
				ct = getColorTransform(hash.skin_tint_color);
				
				if (skull_color) skull_color.transform.colorTransform = ct;
				if (torso_color) torso_color.transform.colorTransform = ct;
				if (arm_upper_close_color) arm_upper_close_color.transform.colorTransform = ct;
				if (arm_upper_offside_color) arm_upper_offside_color.transform.colorTransform = ct;
				if (arm_lower_close_color) arm_lower_close_color.transform.colorTransform = ct;
				if (arm_lower_offside_color) arm_lower_offside_color.transform.colorTransform = ct;
				if (hand_close_color) hand_close_color.transform.colorTransform = ct;
				if (hand_offside_color) hand_offside_color.transform.colorTransform = ct;
				if (leg_upper_close_color) leg_upper_close_color.transform.colorTransform = ct;
				if (leg_upper_offside_color) leg_upper_offside_color.transform.colorTransform = ct;
				if (leg_lower_close_color) leg_lower_close_color.transform.colorTransform = ct;
				if (leg_lower_offside_color) leg_lower_offside_color.transform.colorTransform = ct;
				if (foot_close_color) foot_close_color.transform.colorTransform = ct;
				if (foot_offside_color) foot_offside_color.transform.colorTransform = ct;
				
				if (back_skull_color) back_skull_color.transform.colorTransform = ct;
				if (back_torso_color) back_torso_color.transform.colorTransform = ct;
				if (back_arm_upper_left_color) back_arm_upper_left_color.transform.colorTransform = ct;
				if (back_arm_upper_right_color) back_arm_upper_right_color.transform.colorTransform = ct;
				if (back_arm_lower_left_color) back_arm_lower_left_color.transform.colorTransform = ct;
				if (back_arm_lower_right_color) back_arm_lower_right_color.transform.colorTransform = ct;
				if (back_hand_left_color) back_hand_left_color.transform.colorTransform = ct;
				if (back_hand_right_color) back_hand_right_color.transform.colorTransform = ct;
				if (back_leg_upper_left_color) back_leg_upper_left_color.transform.colorTransform = ct;
				if (back_leg_upper_right_color) back_leg_upper_right_color.transform.colorTransform = ct;
				if (back_leg_lower_left_color) back_leg_lower_left_color.transform.colorTransform = ct;
				if (back_leg_lower_right_color) back_leg_lower_right_color.transform.colorTransform = ct;
				if (back_foot_left_color) back_foot_left_color.transform.colorTransform = ct;
				if (back_foot_right_color) back_foot_right_color.transform.colorTransform = ct;
				
				if (ear_close_color) ear_close_color.transform.colorTransform = ct;
				if (back_ears_color) back_ears_color.transform.colorTransform = ct;
			}
			
			if (hair && hash.hasOwnProperty('hair_tint_color')) {
				ct = getColorTransform(hash.hair_tint_color);
				
				if (hair_color) hair_color.transform.colorTransform = ct;
				if (back_hair_color) back_hair_color.transform.colorTransform = ct;
			}
			
			if (eye_close && hash.hasOwnProperty('eye_scale')) {
				eye_close.scaleX = eye_close.scaleY = Number(hash.eye_scale)
			}
			if (eye_offside && hash.hasOwnProperty('eye_scale')) {
				eye_offside.scaleX = eye_offside.scaleY = Number(hash.eye_scale);
			}
			if (nose && hash.hasOwnProperty('nose_scale')) {
				nose.scaleX = nose.scaleY = Number(hash.nose_scale);
			}
			if (mouth && hash.hasOwnProperty('mouth_scale')) {
				mouth.scaleX = mouth.scaleY = Number(hash.mouth_scale);
			}
			if (ear_close && hash.hasOwnProperty('ears_scale')) {
				ear_close.scaleX = ear_close.scaleY = Number(hash.ears_scale);
				if (ear_close_color) ear_close_color.scaleX = ear_close_color.scaleY = Number(hash.ears_scale);
			}
			if (back_ears && hash.hasOwnProperty('ears_scale')) {
				back_ears.scaleX = back_ears.scaleY = Number(hash.ears_scale);
				if (back_ears_color) back_ears_color.scaleX = back_ears_color.scaleY = Number(hash.ears_scale);
			}
			
			avatarContainer_mc.sideHeadContainer_mc.sideMouthContainer_mc.y = mouth_y;
			if (hash.hasOwnProperty('mouth_height')) {
				avatarContainer_mc.sideHeadContainer_mc.sideMouthContainer_mc.y+= int(hash.mouth_height);
			}
			
			avatarContainer_mc.sideHeadContainer_mc.sideNoseContainer_mc.y = nose_y;
			if (hash.hasOwnProperty('nose_height')) {
				avatarContainer_mc.sideHeadContainer_mc.sideNoseContainer_mc.y+= int(hash.nose_height);
			}
			
			avatarContainer_mc.sideHeadContainer_mc.sideEarCloseContainer_mc.y = ear_close_y;
			//avatarContainer_mc.backEarsContainer_mc.y = back_ears_y;
			if (hash.hasOwnProperty('ears_height')) {
				avatarContainer_mc.sideHeadContainer_mc.sideEarCloseContainer_mc.y+= int(hash.ears_height);
				//avatarContainer_mc.backEarsContainer_mc.y+= int(hash.ears_height);
			}
			
			avatarContainer_mc.sideHeadContainer_mc.sideEyeCloseContainer_mc.x = eye_close_x;
			if (hash.hasOwnProperty('eye_dist')) {
				avatarContainer_mc.sideHeadContainer_mc.sideEyeCloseContainer_mc.x-= int(hash.eye_dist);
			}
			
			avatarContainer_mc.sideHeadContainer_mc.sideEyeOffsideContainer_mc.x = eye_offside_x;
			if (hash.hasOwnProperty('eye_dist')) {
				avatarContainer_mc.sideHeadContainer_mc.sideEyeOffsideContainer_mc.x+= int(hash.eye_dist);
			}
			
			avatarContainer_mc.sideHeadContainer_mc.sideEyeCloseContainer_mc.y = eye_close_y;
			if (hash.hasOwnProperty('eye_height')) {
				avatarContainer_mc.sideHeadContainer_mc.sideEyeCloseContainer_mc.y+= int(hash.eye_height);
			}
			
			avatarContainer_mc.sideHeadContainer_mc.sideEyeOffsideContainer_mc.y = eye_offside_y;
			if (hash.hasOwnProperty('eye_height')) {
				avatarContainer_mc.sideHeadContainer_mc.sideEyeOffsideContainer_mc.y+= int(hash.eye_height);
			}
			
		}
		
		/*****************************************************************************
		 * 	  To a single movement with the Avatar container the following time 
		 * 	  frames must be referenced:    
		 * 
		 * 	  -   main movement container - avatarContainer_mc 
		 *    
		 *    
		 * 	  -   Mouth    
		 *    -   Eyes containers: 
		 * 					@ Close eye
		 * 					@ Offside eye	
		 * 		ActionTypes:  (see samples above for implemenation)   
		 * 					A) walk1x
		 * 					b) walk2x
		 * 					c) ignore
		 * 					d) ignore2
		 * 					e) jumpUp
		 * 					f) jumpOver
		 * 					g) surprise
		 * 					h) happy
		 * 					i) angry
		 * 					j) idle1,idle2,idle3 idle4
		 * 					k) climb 
		 * 		***  NOTE:  only the avatarContainer_mc has a climb animation    ***
		 * 		***  don't reference the eyes or mouth animations for climb      ***
		 * 					l) do			
		 * 
		 *****************************************************************************/
		
		public function gotoFrameNumAndStop(num:int):void {
			avatarContainer_mc.gotoAndStop(num);

			var i:int;
			for (i=0;i<back_animated_mcs.length;i++) {
				if (this[back_animated_mcs[i]]) this[back_animated_mcs[i]].gotoAndStop(num);
			}
			for (i=0;i<side_animated_mcs.length;i++) {
				if (this[side_animated_mcs[i]]) this[side_animated_mcs[i]].gotoAndStop(num);
			}
			
			stopAll();
		}
			
		public function stopAll():void {
			avatarContainer_mc.stop();
			
			var i:int;
			for (i=0;i<back_animated_mcs.length;i++) {
				if (this[back_animated_mcs[i]]) this[back_animated_mcs[i]].stop();
			}
			for (i=0;i<side_animated_mcs.length;i++) {
				if (this[side_animated_mcs[i]]) this[side_animated_mcs[i]].stop();
			}
			//warn('stopped')
		}
		
		private function playSideAnimation(anim:String):void {
			avatarContainer_mc.gotoAndPlay(anim);
			
			var i:int;
			for (i=0;i<back_animated_mcs.length;i++) {
				if (this[back_animated_mcs[i]]) this[back_animated_mcs[i]].stop();
			}
			for (i=0;i<side_animated_mcs.length;i++) {
				if (this[side_animated_mcs[i]]) this[side_animated_mcs[i]].gotoAndPlay(anim);
			}
			
			//warn('side anim '+anim)
		}
		
		private function playBackAnimation(anim:String):void {
			avatarContainer_mc.gotoAndPlay(anim);

			var i:int;
			for (i=0;i<back_animated_mcs.length;i++) {
				if (this[back_animated_mcs[i]]) this[back_animated_mcs[i]].gotoAndPlay(anim);
			}
			for (i=0;i<side_animated_mcs.length;i++) {
				if (this[side_animated_mcs[i]]) this[side_animated_mcs[i]].stop();
			}

			//warn('back anim '+anim)
		}
		
		private function assetExists(class_name:String):Boolean {
			if (asset_provider.loaderInfo.applicationDomain.hasDefinition(class_name)) return true;
			return false;
		}
		
		public function getAssetByName(class_name:String):MovieClip {
			
			var mc:MovieClip;
			if (class_name && class_name.indexOf('none') != class_name.length-4 && class_name.indexOf('null') != class_name.length-4) {
				if (assetExists(class_name)) {
					//info(class_name);
					var C:Class
					C = asset_provider.loaderInfo.applicationDomain.getDefinition(class_name) as Class;
					mc = new C();
				} else {
					warn('getAssetByName unable to find class named "'+class_name+'"');
				}
			}
			
			return mc;
			
		}
		
		private function removeArticleFromContainer(p:MovieClip, container_name:String):void {
			var container:MovieClip = p[container_name];
			if (!container) {
				warn(container_name+' is null while trying to remove article')
				return;
			}
			while (container.numChildren) container.removeChildAt(0);
		}
		
		private function addArticleToContainer(name:String, p:MovieClip, container_name:String, colorFiltersA:Array = null):MovieClip {
			var container:MovieClip = p[container_name];
			var article:MovieClip = getAssetByName(name);
			if (!article) article = new MovieClip(); 
			if (container) {
				removeArticleFromContainer(p, container_name);	
			} else {
				warn(container_name+' is null while trying to add '+name);
				return article;
			}

			//apply masks

			if (name.toLowerCase().indexOf('eyeclose')>-1) {
				//article.scaleX = 3;
				article.mask = eye_close_mask;
			} else if (name.toLowerCase().indexOf('eyeoffside')>-1) {
				//article.scaleX = 3;
				article.mask = eye_offside_mask;
			} else if (name.toLowerCase().indexOf('mouth')>-1) {
				//article.scaleX = 3;
				article.mask = mouth_mask;
			}
			container.addChildAt(article, 0);
			
			if (colorFiltersA) {
				for (var i:int;i<colorFiltersA.length;i++) {
					maybeColorIt(article, 'color_'+(i+1), colorFiltersA[i]);
				}
			}

			return article;
		}
		
		private function addOrRemove(prefix:String, id:String, p:MovieClip, container_name:String, colorFiltersA:Array = null):MovieClip {
			var class_name:String = prefix+id;
			
			if (!id || id == 'none' || !assetExists(class_name)) {
				removeArticleFromContainer(p, container_name);
				return null;
			}
			
			return addArticleToContainer(class_name, p, container_name, colorFiltersA);
			
		}
		
		private function maybeColorIt(mc:MovieClip, name:String, filtersA:Array):void {
			if (!mc) return;
			if (!mc[name]) return;
			//info('coloring '+name)
			
			mc[name].filters = filtersA;
		}
		
		private function addDress(id:String) {
			//addOrRemove(DRESS, id, avatarContainer_mc, 'sideDressContainer_mc');
			//addOrRemove(BACKDRESS, id, avatarContainer_mc, 'backDressContainer_mc');
			
			var new_back_dress:MovieClip = addArticleToContainer(BACKDRESS+id+'', avatarContainer_mc, 'backDressContainer_mc');
			if (new_back_dress) {
				back_dress = new_back_dress;
			}
			
			var new_dress:MovieClip = addArticleToContainer(DRESS+id, avatarContainer_mc, 'sideDressContainer_mc');
			if (new_dress) {
				dress = new_dress;
			}
		}
		
		private function addCape(id:String) {
			addOrRemove(CAPETIE, id, avatarContainer_mc, 'sideCapeTieContainer_mc');
			
			var new_back_cape:MovieClip = addArticleToContainer(BACKCAPE+id+'', avatarContainer_mc, 'backCapeContainer_mc');
			if (new_back_cape) {
				back_cape = new_back_cape;
			}
			
			var new_cape:MovieClip = addArticleToContainer(CAPE+id, avatarContainer_mc, 'sideCapeContainer_mc');
			if (new_cape) {
				cape = new_cape;
			}
		}
		
		private function addSkirt(id:String) {
			
			var new_back_skirt:MovieClip = addArticleToContainer(BACKSKIRT+id+'', avatarContainer_mc, 'backDressContainer_mc');
			if (new_back_skirt) {
				back_skirt = new_back_skirt;
			}
			
			var new_skirt:MovieClip = addArticleToContainer(SKIRT+id, avatarContainer_mc, 'sideDressContainer_mc');
			if (new_skirt) {
				skirt = new_skirt;
			}
		}
		
		private function addPants(id:String) {
			var color1:Array = [ColorMatrix.getFilter(0, 0, 0, 0xcc0000, 100)];
			var color2:Array = [ColorMatrix.getFilter(100, 0, 0, 0x00cc00, 100)];
			var colorFiltersA:Array = [color1, color2];
			
			addOrRemove(PANTSTOP, id, avatarContainer_mc, 'sidePantsBottomContainer_mc', colorFiltersA);
			addOrRemove(BACKPANTSTOP, id, avatarContainer_mc, 'backPantsBottomContainer_mc', colorFiltersA);
			addOrRemove(PANTSLEGUPPERCLOSE, id, avatarContainer_mc, 'sidePantsUpperCloseContainer_mc', colorFiltersA);
			addOrRemove(BACKPANTSLEGUPPERLEFT, id, avatarContainer_mc, 'backPantsUpperLeftContainer_mc', colorFiltersA);
			addOrRemove(PANTSLEGLOWERCLOSE, id, avatarContainer_mc, 'sidePantsLowerCloseContainer_mc', colorFiltersA);
			addOrRemove(BACKPANTSLEGLOWERLEFT, id, avatarContainer_mc, 'backPantsLowerLeftContainer_mc', colorFiltersA);
			addOrRemove(PANTSLEGUPPEROFFSIDE, id, avatarContainer_mc, 'sidePantsUpperOffsideContainer_mc', colorFiltersA);
			addOrRemove(BACKPANTSLEGUPPERRIGHT, id, avatarContainer_mc, 'backPantsUpperRightContainer_mc', colorFiltersA);
			addOrRemove(PANTSLEGLOWEROFFSIDE, id, avatarContainer_mc, 'sidePantsLowerOffsideContainer_mc', colorFiltersA);
			addOrRemove(BACKPANTSLEGLOWERRIGHT, id, avatarContainer_mc, 'backPantsLowerRightContainer_mc', colorFiltersA);
		}
		
		private function addShirt(id:String) {
			var color1:Array = [ColorMatrix.getFilter(0, 0, 0, 0xcc0000, 100)];
			var color2:Array = [ColorMatrix.getFilter(100, 0, 0, 0x00cc00, 100)];
			var colorFiltersA:Array = [color1, color2];
			
			addOrRemove(SHIRTTORSO, id, avatarContainer_mc, 'sideShirtContainer_mc', colorFiltersA);
			addOrRemove(BACKSHIRTTORSO, id, avatarContainer_mc, 'backShirtContainer_mc', colorFiltersA);
			addOrRemove(SLEEVEUPPERCLOSE, id, avatarContainer_mc, 'sideShirtSleeveUpperCloseContainer_mc', colorFiltersA);
			addOrRemove(BACKSLEEVEUPPERLEFT, id, avatarContainer_mc, 'backSleeveUpperLeftContainer_mc', colorFiltersA);
			addOrRemove(SLEEVELOWERCLOSE, id, avatarContainer_mc, 'sideShirtSleeveLowerCloseContainer_mc', colorFiltersA);
			addOrRemove(BACKSLEEVELOWERLEFT, id, avatarContainer_mc, 'backSleeveLowerLeftContainer_mc', colorFiltersA);
			addOrRemove(SLEEVEUPPEROFFSIDE, id, avatarContainer_mc, 'sideShirtSleeveUpperOffsideContainer_mc', colorFiltersA);
			addOrRemove(BACKSLEEVEUPPERRIGHT, id, avatarContainer_mc, 'backSleeveUpperRightContainer_mc', colorFiltersA);
			addOrRemove(SLEEVELOWEROFFSIDE, id, avatarContainer_mc, 'sideShirtSleeveLowerOffsideContainer_mc', colorFiltersA);
			addOrRemove(BACKSLEEVELOWERRIGHT, id, avatarContainer_mc, 'backSleeveLowerRightContainer_mc', colorFiltersA);
		}
		
		private function addCoat(id:String) {
			addOrRemove(COATCLOSE, id, avatarContainer_mc, 'sideCoatCloseContainer_mc');
			addOrRemove(COATOFFSIDE, id, avatarContainer_mc, 'sideCoatOffsideContainer_mc');
			addOrRemove(BACKCOAT, id, avatarContainer_mc, 'backCoatContianer_mc');
			addOrRemove(COATSLEEVEUPPERCLOSE, id, avatarContainer_mc, 'sideShirtSleeveUpperCloseContainer_mc');
			addOrRemove(BACKCOATSLEEVEUPPERLEFT, id, avatarContainer_mc, 'backSleeveUpperLeftContainer_mc');
			addOrRemove(COATSLEEVELOWERCLOSE, id, avatarContainer_mc, 'sideShirtSleeveLowerCloseContainer_mc');
			addOrRemove(BACKCOATSLEEVELOWERLEFT, id, avatarContainer_mc, 'backSleeveLowerLeftContainer_mc');
			addOrRemove(COATSLEEVEUPPEROFFSIDE, id, avatarContainer_mc, 'sideShirtSleeveUpperOffsideContainer_mc');
			addOrRemove(BACKCOATSLEEVEUPPERRIGHT, id, avatarContainer_mc, 'backSleeveUpperRightContainer_mc');
			addOrRemove(COATSLEEVELOWEROFFSIDE, id, avatarContainer_mc, 'sideShirtSleeveLowerOffsideContainer_mc');
			addOrRemove(BACKCOATSLEEVELOWERRIGHT, id, avatarContainer_mc, 'backSleeveLowerRightContainer_mc');
		}
		
		private function addShoe(id:String) {
			addOrRemove(SHOECLOSE, id, avatarContainer_mc, 'sideShoeCloseContainer_mc');
			addOrRemove(BACKSHOELEFT, id, avatarContainer_mc, 'backShoeLeftContainer_mc');
			addOrRemove(SHOEOFFSIDE, id, avatarContainer_mc, 'sideShoeOffsideContainer_mc');
			addOrRemove(BACKSHOERIGHT, id, avatarContainer_mc, 'backShoeRightContainer_mc');
		}
		
		private function addGlove(id:String) {
			addOrRemove(GLOVECLOSE, id, avatarContainer_mc, 'sideGloveCloseContainer_mc');
			addOrRemove(GLOVEOFFSIDE, id, avatarContainer_mc, 'sideGloveOffsideContainer_mc');
		}
		
		private function addEyes(id:String) {
			var new_eye_close:MovieClip = addArticleToContainer(SIDEEYECLOSE+id, avatarContainer_mc.sideHeadContainer_mc, 'sideEyeCloseContainer_mc');
			if (new_eye_close) eye_close = new_eye_close;
			// TODO gotoAndPlay on the new asset to set it to the same frame as avatarContainer_mc
			
			var new_eye_offside:MovieClip = addArticleToContainer(SIDEEYEOFFSIDE+id, avatarContainer_mc.sideHeadContainer_mc, 'sideEyeOffsideContainer_mc');
			if (new_eye_offside) eye_offside = new_eye_offside;
			// TODO gotoAndPlay on the new asset to set it to the same frame as avatarContainer_mc
		}
		
		private function addEars(id:String) {
			var new_ear:MovieClip = addOrRemove(SIDEEARCLOSE, id, avatarContainer_mc.sideHeadContainer_mc, 'sideEarCloseContainer_mc');
			ear_close = new_ear
			if (new_ear) {
				if (assetExists(SIDEEARCLOSE+id) && avatarContainer_mc.sideHeadContainer_mc.sideEarCloseContainer_mc) {
					ear_close_color = avatarContainer_mc.sideHeadContainer_mc.sideEarCloseContainer_mc.addChild(getAssetByName(SIDEEARCLOSE+id)) as MovieClip;
					ear_close_color.blendMode = BlendMode.HARDLIGHT;
				}
			}
			
			var new_back_ears:MovieClip = addOrRemove(BACKEARS, id, avatarContainer_mc, 'backEarsContainer_mc');
			back_ears = new_back_ears;
			if (new_back_ears) {
				if (assetExists(BACKEARS+id) && avatarContainer_mc.backEarsContainer_mc) {
					back_ears_color = avatarContainer_mc.backEarsContainer_mc.addChild(getAssetByName(BACKEARS+id)) as MovieClip;
					back_ears_color.blendMode = BlendMode.HARDLIGHT;
				}
			}
		}
		
		private function addSocks(id:String):void {
			addOrRemove(SOCKCLOSE, id, avatarContainer_mc, 'sideSockCloseContainer_mc');
			addOrRemove(SOCKOFFSIDE, id, avatarContainer_mc, 'sideSockOffsideContainer_mc');
		}	
		
		private function addRing(id:String):void {
			addOrRemove(RING, id, avatarContainer_mc, 'sideRingCloseContainer_mc');
		}
		
		private function addNecklace(id:String):void {
			addOrRemove(NECKLACE, id, avatarContainer_mc, 'sideNecklaceContainer_mc');
		}
		
		private function addBracelet(id:String):void {
			addOrRemove(BRACELETCLOSE, id, avatarContainer_mc, 'sideBraceletCloseContainer_mc');
			addOrRemove(BACKBRACELETRIGHT, id, avatarContainer_mc, 'backBraceletRightContainer_mc');
		}
		
		private function addNose(id:String):void {
			nose = addOrRemove(SIDENOSE, id, avatarContainer_mc.sideHeadContainer_mc, 'sideNoseContainer_mc');
		}
		
		private function addHair(id:String):void {
			
			var new_back_hair:MovieClip = addArticleToContainer(BACKHAIR+id+'', avatarContainer_mc, 'backHairContainer_mc');
			if (new_back_hair) {
				back_hair = new_back_hair;
				if (assetExists(BACKHAIR+id) && avatarContainer_mc.backHairContainer_mc) {
					back_hair_color = avatarContainer_mc.backHairContainer_mc.addChild(getAssetByName(BACKHAIR+id)) as MovieClip;
					back_hair_color.blendMode = BlendMode.OVERLAY;
				}
			}
			
			var new_hair:MovieClip = addArticleToContainer(SIDEHAIR+id, avatarContainer_mc.sideHeadContainer_mc, 'sideHairContainer_mc');
			if (new_hair) {
				hair = new_hair;
				if (assetExists(SIDEHAIR+id)) {
					hair_color = avatarContainer_mc.sideHeadContainer_mc.sideHairContainer_mc.addChild(getAssetByName(SIDEHAIR+id)) as MovieClip;
					hair_color.blendMode = BlendMode.OVERLAY;
					//hair_color.x = -50
				}
			}
			
			
			// TODO gotoAndPlay on the new asset to set it to the same frame as avatarContainer_mc
		}
		
		private function addHat(id:String):void {
			
			var new_back_hat:MovieClip = addArticleToContainer(BACKHAT+id+'', avatarContainer_mc, 'backHatContainer_mc');
			if (new_back_hat) {
				back_hat = new_back_hat;
			}
			
			var new_hat:MovieClip = addArticleToContainer(SIDEHAT+id, avatarContainer_mc.sideHeadContainer_mc, 'sideHatContainer_mc');
			if (new_hat) {
				hat = new_hat;
			}
			
		}
		
		private function addMouth(id:String):void {
			var new_mouth:MovieClip = addArticleToContainer(SIDEMOUTH+id, avatarContainer_mc.sideHeadContainer_mc, 'sideMouthContainer_mc');
			if (new_mouth) mouth = new_mouth;
			// TODO gotoAndPlay on the new asset to set it to the same frame as avatarContainer_mc
		}
		
		private function colorNumToStr(color:uint):String {
			var color_str:String = color.toString(16).toUpperCase();
			while(color_str.length < 6) color_str = "0" + color_str;
			return color_str;
		}
		
		private function colorStrToNum(color:String):uint {
			return parseInt("0x" + color, 16);
		}
		
		public var options:Object = {
			
		}
	}
}
