package  {
	
	import com.quasimondo.geom.ColorMatrix;
	import com.tinyspeck.debug.BootError;
	import com.tinyspeck.debug.Console;
	import com.tinyspeck.engine.data.pc.AvatarConfig;
	import com.tinyspeck.engine.data.pc.AvatarConfigArticle;
	import com.tinyspeck.engine.data.pc.AvatarConfigArticleColor;
	import com.tinyspeck.engine.loader.AvatarConfigRecord;
	import com.tinyspeck.engine.loader.AvatarResourceManager;
	
	import flash.display.BlendMode;
	import flash.display.FrameLabel;
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import flash.system.ApplicationDomain;
	import flash.system.Security;
	import flash.utils.flash_proxy;
	import flash.utils.getQualifiedClassName;
	import flash.utils.setTimeout;
	
	public class Avatar2011 extends MovieClip {
		
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
		private var arm:AvatarResourceManager;
		
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
		private var shirt_torso:MovieClip;
		private var coat_side_close:MovieClip;
		private var coat_side_offside:MovieClip;
		private var coat_back:MovieClip;
		
		// below are the skin clips
		private var skull:MovieClip;
		private var torso:MovieClip;
		private var arm_upper_close:MovieClip;
		private var arm_upper_offside:MovieClip;
		private var arm_lower_close:MovieClip;
		private var arm_lower_offside:MovieClip;
		private var hand_close:MovieClip;
		private var hand_offside:MovieClip;
		private var leg_upper_close:MovieClip;
		private var leg_upper_offside:MovieClip;
		private var leg_lower_close:MovieClip;
		private var leg_lower_offside:MovieClip;
		private var foot_close:MovieClip;
		private var foot_offside:MovieClip;
		private var back_skull:MovieClip;
		private var back_torso:MovieClip;
		private var back_arm_upper_left:MovieClip;
		private var back_arm_upper_right:MovieClip;
		private var back_arm_lower_left:MovieClip;
		private var back_arm_lower_right:MovieClip;
		private var back_hand_left:MovieClip;
		private var back_hand_right:MovieClip;
		private var back_leg_upper_left:MovieClip;
		private var back_leg_upper_right:MovieClip;
		private var back_leg_lower_left:MovieClip;
		private var back_leg_lower_right:MovieClip;
		private var back_foot_left:MovieClip;
		private var back_foot_right:MovieClip;
//		private var ear_close:MovieClip;
//		private var back_ears:MovieClip;
		
		private var skin_mcsA:Array = [
			'skull',
			'torso',
			'arm_upper_close',
			'arm_upper_offside',
			'arm_lower_close',
			'arm_lower_offside',
			'hand_close',
			'hand_offside',
			'leg_upper_close',
			'leg_upper_offside',
			'leg_lower_close',
			'leg_lower_offside',
			'foot_close',
			'foot_offside',
			'back_skull',
			'back_torso',
			'back_arm_upper_left',
			'back_arm_upper_right',
			'back_arm_lower_left',
			'back_arm_lower_right',
			'back_hand_left',
			'back_hand_right',
			'back_leg_upper_left',
			'back_leg_upper_right',
			'back_leg_lower_left',
			'back_leg_lower_right',
			'back_foot_left',
			'back_foot_right'/*,
			'ear_close',
			'back_ears'*/
		];
		
		// this array needs to correspond to the above
		private var skin_class_namesA:Array = [
			'sideSkull',
			'sideTorso',
			'sideArmUpperClose',
			'sideArmUpperOffside',
			'sideArmLowerClose',
			'sideArmLowerOffside',
			'sideHandClose',
			'sideHandOffside',
			'sideLegUpperClose',
			'sideLegUpperOffside',
			'sideLegLowerClose',
			'sideLegLowerOffside',
			'sideFootClose',
			'sideFootOffside',
			'backHead',
			'backTorso',
			'backArmUpperLeft',
			'backArmUpperRight',
			'backArmLowerLeft',
			'backArmLowerRight',
			'backHandLeft',
			'backHandRight',
			'backLegUpperLeft',
			'backLegUpperRight',
			'backLegLowerLeft',
			'backLegLowerRight',
			'backFootLeft',
			'backFootRight'
		]
		
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
		
		private var skin_color_mcsA:Array = [
			'skull_color',
			'torso_color',
			'arm_upper_close_color',
			'arm_upper_offside_color',
			'arm_lower_close_color',
			'arm_lower_offside_color',
			'hand_close_color',
			'hand_offside_color',
			'leg_upper_close_color',
			'leg_upper_offside_color',
			'leg_lower_close_color',
			'leg_lower_offside_color',
			'foot_close_color',
			'foot_offside_color',
			'back_skull_color',
			'back_torso_color',
			'back_arm_upper_left_color',
			'back_arm_upper_right_color',
			'back_arm_lower_left_color',
			'back_arm_lower_right_color',
			'back_hand_left_color',
			'back_hand_right_color',
			'back_leg_upper_left_color',
			'back_leg_upper_right_color',
			'back_leg_lower_left_color',
			'back_leg_lower_right_color',
			'back_foot_left_color',
			'back_foot_right_color',
			'ear_close_color',
			'back_ears_color'
		];
		
		private var back_hair_color:MovieClip;
		private var hair_color:MovieClip;

		private var hair_color_mcsA:Array = [
			'hair_color',
			'back_hair_color'
		];
		
		// below are the masks we use for the face
		private var mouth_mask:MovieClip;
		private var eye_close_mask:MovieClip;
		private var eye_offside_mask:MovieClip;
		
		// below are for storing the initial positions of the face parts
		private var mouth_y:Number;
		private var nose_y:Number;
		private var ear_close_y:Number;
		private var eye_close_x:Number;
		private var eye_offside_x:Number;
		private var eye_close_y:Number;
		private var eye_offside_y:Number;
		
		// these are the dudes we need to animate:
		private var side_animated_mcs:Array = ['hat', 'hair', 'hair_color', 'skirt', 'shirt_torso', 'dress', 'mouth', 'eye_offside', 'eye_close', 'cape', 'coat_side_close', 'coat_side_offside'];
		private var back_animated_mcs:Array = ['back_hat', 'back_hair', 'back_hair_color', 'back_skirt', 'back_dress', 'back_cape', 'coat_back'];
		
		public function Avatar2011() {
			Security.allowDomain('*');
			initAvatar();
			//Console.setPri('0' );
		}
		
		private function initAvatar():void {
			BootError.stage = stage;
			
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
			
			setSkinParts();
			
			// do masking for face
			mouth_mask = new sideSkull();
			mouth_mask.visible = false;
			mouth_mask.name = 'mouth_mask';
			mouth_mask.x = skull.x;
			mouth_mask.y = skull.y;
			skull.parent.addChild(mouth_mask);
			
			eye_close_mask = new sideSkull();
			eye_close_mask.visible = false;
			eye_close_mask.name = 'eye_close_mask';
			eye_close_mask.x = skull.x;
			eye_close_mask.y = skull.y;
			skull.parent.addChild(eye_close_mask);
			
			eye_offside_mask = new sideSkull();
			eye_offside_mask.visible = false;
			eye_offside_mask.name = 'eye_offside_mask';
			eye_offside_mask.x = skull.x;
			eye_offside_mask.y = skull.y;
			skull.parent.addChild(eye_offside_mask);
			
			mouth_y = avatarContainer_mc.sideHeadContainer_mc.sideMouthContainer_mc.y;
			nose_y = avatarContainer_mc.sideHeadContainer_mc.sideNoseContainer_mc.y;
			ear_close_y = avatarContainer_mc.sideHeadContainer_mc.sideEarCloseContainer_mc.y;
			eye_close_x = avatarContainer_mc.sideHeadContainer_mc.sideEyeCloseContainer_mc.x;
			eye_offside_x = avatarContainer_mc.sideHeadContainer_mc.sideEyeOffsideContainer_mc.x;
			eye_close_y = avatarContainer_mc.sideHeadContainer_mc.sideEyeCloseContainer_mc.y;
			eye_offside_y = avatarContainer_mc.sideHeadContainer_mc.sideEyeOffsideContainer_mc.y;
			
			// for now
			var temp:String = 'http://c2.glitch.bz/clothing/base/1294351698.swf';
			var temp1:String = 'http://localhost:81/ts/swf/package1.swf?'+new Date().getTime();
			var temp2:String = 'http://localhost:81/ts/swf/package2.swf?'+new Date().getTime();
			var ac:AvatarConfig = AvatarConfig.fromAnonymous({
				"nose_scale"		: "1.002",
				"nose_height"		: "-0.03",
				
				"ears_height"		: "0",
				"ears_scale"		: "1.002",
				
				"eye_dist"		: "-1",
				"eye_height"		: "1.03",
				"eye_scale"		: "1",
				
				"mouth_scale"		: "1.002",
				"mouth_height"		: "0",
				
				"skin_tint_color"	: "D4C159",
				
				"hair_tint_color"	: "0",
				
				"articles": {
					nose: {
						package_swf_url: temp,
						article_class_name: 'none'
					},
					
					ears: {
						package_swf_url: temp,
						article_class_name: 'none'
					},
					
					eyes: {
						package_swf_url: temp,
						article_class_name: 'eyes_01'
					},
					
					mouth: {
						package_swf_url: temp,
						article_class_name: 'none'
					},
					
					hair: {
						package_swf_url: temp,
						article_class_name: 'none'
					},
					
					necklace: {
						package_swf_url: temp,
						article_class_name: 'none'
					},
					
					ring: {
						package_swf_url: temp,
						article_class_name: 'none'
					},
					
					gloves: {
						package_swf_url: temp,
						article_class_name: 'none'
					},
					
					bracelet: {
						package_swf_url: temp,
						article_class_name: 'none'
					},
					
					hat: {
						package_swf_url: temp,
						article_class_name: 'none'
					},
					
					dress: {
						package_swf_url: temp,
						article_class_name: 'none'
					},
					
					shoes: {
						package_swf_url: temp,
						article_class_name: 'none'
					},
					
					pants: {
						package_swf_url: temp,
						article_class_name: 'none'
					},
					
					skirt: {
						package_swf_url: temp,
						article_class_name: 'none'
					},
					
					shirt: {
						package_swf_url: temp,
						article_class_name: '20101130',
						colors: {
							color_1: {
								tintColor: 'cc0000', // hex
								brightness: 100, // [-100:100], 100 default
								saturation: 100, // [-100:100], 100 default
								contrast: 100, // [-100:100], 100 default
								tintAmount: 100 // [0 - 100], 0 default
							},
							color_2: {
								tintColor: '00cc00',
								brightness: 200,
								saturation: 100,
								contrast: 100,
								tintAmount: 100
							},
							color_3: {
								tintColor: '0000cc',
								brightness: 200,
								saturation: 100,
								contrast: 100,
								tintAmount: 100
							}
						}
					}
				}
				
				
			});
			
			//initializeHead(ac);
			//hideBody();
			//hideHead();
			/*
			setTimeout(function():void {
				switchSkinVisibility(false);
				addSpecialSkinParts('1');
			}, 3000);
			setTimeout(function():void {
				addSpecialSkinParts('2');
			}, 4000);
			setTimeout(function():void {
				switchSkinVisibility(true);
				removeSpecialSkinParts();
			}, 6000);
			*/
			//switchSkinVisibility(false);
			//addSpecialSkinParts('2');
		}
		
		public function setAvatarResourceManager(arm:AvatarResourceManager):void {
			this.arm = arm;
		}
		
		public function showPlaceholderSkin():void {
			switchSkinVisibility(false);
			addSpecialSkinParts('2');
		}
		
		public function hidePlaceholderSkin():void {
			switchSkinVisibility(true);
			removeSpecialSkinParts();
		}
		
		private var special_skinsA:Array = [];
		private function addSpecialSkinParts(id:String):void {
			removeSpecialSkinParts();
			var C:Class;
			var p:MovieClip;
			var class_name:String;
			var app_domain:ApplicationDomain = loaderInfo.applicationDomain; // this is null when loading the avatar swf into client into the current domain, so
			if (!app_domain) app_domain = ApplicationDomain.currentDomain;
			
			for (var i:int;i<skin_mcsA.length;i++) {
				p = this[skin_mcsA[i]];
				if (p && p.parent) {
					class_name = skin_class_namesA[i]+id;
						
					if (!app_domain || !app_domain.hasDefinition(class_name)) {
						Console.warn(class_name+' not exists')
						continue;
					}
					C = app_domain.getDefinition(class_name) as Class;
					if (C) special_skinsA.push(p.parent.addChild(new C()));
				}
			}
		}
		
		private function removeSpecialSkinParts():void {
			for (var i:int;i<special_skinsA.length;i++) {
				if (special_skinsA[i] && special_skinsA[i].parent) special_skinsA[i].parent.removeChild(special_skinsA[i]);
			}
			special_skinsA.length = 0;
		}
		
		public function showHead():void {
			// hides only skull, not eyes etc.
			switchBodyPartVisibility(avatarContainer_mc.sideHeadContainer_mc.sideSkullContainer_mc, true);
			switchBodyPartVisibility(avatarContainer_mc.backHeadContainer_mc.backHead_mc, true);
		}
		
		public function hideHead():void {
			// hides only skull, not eyes etc.
			switchBodyPartVisibility(avatarContainer_mc.sideHeadContainer_mc.sideSkullContainer_mc, false);
			switchBodyPartVisibility(avatarContainer_mc.backHeadContainer_mc.backHead_mc, false);
		}
		
		public function showAllHead():void {
			// hides all face things
			switchBodyPartVisibility(avatarContainer_mc.sideHeadContainer_mc, true);
			switchBodyPartVisibility(avatarContainer_mc.backHeadContainer_mc, true);
		}
		
		public function hideAllHead():void {
			// hides all face things
			switchBodyPartVisibility(avatarContainer_mc.sideHeadContainer_mc, false);
			switchBodyPartVisibility(avatarContainer_mc.backHeadContainer_mc, false);
		}
		
		public function showBody():void {
			switchBodyVisibility(true);
		}
		
		public function hideBody():void {
			switchBodyVisibility(false);
		}
		
		private function switchBodyPartVisibility(part:MovieClip, v:Boolean):void {
			//return;
			part.visible = v;
		}
			
		private function switchBodyVisibility(v:Boolean):void {
			//return;
			if (v) {
				showAllHead();
			} else {
				hideAllHead();
			}
			
			avatarContainer_mc.sideTorsoContainer_mc.visible = v;
			avatarContainer_mc.sideArmUpperCloseContainer_mc.visible = v;
			avatarContainer_mc.sideArmUpperOffsideContainer_mc.visible = v;
			avatarContainer_mc.sideArmLowerCloseContainer_mc.visible = v;
			avatarContainer_mc.sideArmLowerOffsideContainer_mc.visible = v;
			avatarContainer_mc.sideHandCloseContainer_mc.visible = v;
			avatarContainer_mc.sideHandOffsideContainer_mc.visible = v;
			avatarContainer_mc.sideLegUpperCloseContainer_mc.visible = v;
			avatarContainer_mc.sideLegUpperOffsideContainer_mc.visible = v;
			avatarContainer_mc.sideLegLowerCloseContainer_mc.visible = v;
			avatarContainer_mc.sideLegLowerOffsideContainer_mc.visible = v;
			avatarContainer_mc.sideFootCloseContainer_mc.visible = v;
			avatarContainer_mc.sideFootOffsideContainer_mc.visible = v;
			avatarContainer_mc.backTorsoContainer_mc.visible = v;
			avatarContainer_mc.backArmUpperLeftContainer_mc.visible = v;
			avatarContainer_mc.backArmUpperRightContainer_mc.visible = v;
			avatarContainer_mc.backArmLowerLeftContainer_mc.visible = v;
			avatarContainer_mc.backArmLowerRightContainer_mc.visible = v;
			avatarContainer_mc.backHandLeftContainer_mc.visible = v;
			avatarContainer_mc.backHandRightContainer_mc.visible = v;
			avatarContainer_mc.backLegUpperLeftContainer_mc.visible = v;
			avatarContainer_mc.backLegUpperRightContainer_mc.visible = v;
			avatarContainer_mc.backLegLowerLeftNakedContainer_mc.visible = v;
			avatarContainer_mc.backLegLowerRightNakedContainer_mc.visible = v;
			avatarContainer_mc.backFootLeftContainer_mc.visible = v;
			avatarContainer_mc.backFootRightContainer_mc.visible = v;
		}
		
		public var colors_mc_names_by_slot:Object;
		
		// misnamed for legacy sake (it does the whole body, not just the head)
		public function initializeHead(ac:AvatarConfig):void {
			if (!arm) {
				Console.warn('NO AvatarResourceManager.instance; this should only happen when testing as a standalone');
				arm = AvatarResourceManager.instance;
			}
			
			colors_mc_names_by_slot = {};
			
			var acr:AvatarConfigRecord = arm.getRecord(ac);
			
			if (!acr.ready) {
				// maybe we should rmeove all clothes and face parts here?
			} else {
				addEyes(ac.getArticleByType('eyes'));
				addHat(ac.getArticleByType('hat'));
				addHair(ac.getArticleByType('hair'));
				addMouth(ac.getArticleByType('mouth'));
				addEars(ac.getArticleByType('ears'));
				addNose(ac.getArticleByType('nose'));
				addPants(ac.getArticleByType('pants'));
				
				if (ac.getArticleByType('coat') && ac.getArticleByType('coat').article_class_name != 'none') {
					addShirt(ac.getArticleByType('shirt'));
					addCoat(ac.getArticleByType('coat'));
				} else {
					addCoat(ac.getArticleByType('coat'));
					addShirt(ac.getArticleByType('shirt'));
				}
				
				// skirt must be exclusive of dress
				if (ac.getArticleByType('skirt') && ac.getArticleByType('skirt').article_class_name != 'none') {
					addDress(null);
					addSkirt(ac.getArticleByType('skirt'));
				} else {
					addSkirt(null);
					addDress(ac.getArticleByType('dress'));
				}
				
				addCape(ac.getArticleByType('cape'));
				addShoe(ac.getArticleByType('shoes'));
				addGlove(ac.getArticleByType('gloves'));
				addRing(ac.getArticleByType('ring'));
				addNecklace(ac.getArticleByType('necklace'));
				addBracelet(ac.getArticleByType('bracelet'));
				
				// TODO, set all animated things to the correct frame
				var was_stopped:Boolean = all_stopped;
				if (current_anim) playAnimation(current_anim);
				if (was_stopped) stopAll();
				
				//Console.dir(colors_mc_names_by_slot)
			}
			
			
			// end articles that need loading
			
			// start applying colors to skin/hair and do facial feature placement customizations
			
			makeColorMcsForBody();
			
			if (ac.skin_tint_color != -1) {
				addColorTransformToSkinColorParts(getColorTransform(ac.skin_tint_color));
			}
			
			if (hair && ac.hair_tint_color != -1) {
				addColorTransformToHairColorParts(getColorTransform(ac.hair_tint_color));
			}
			
			if (eye_close && ac.hasOwnProperty('eye_scale')) {
				eye_close.scaleX = eye_close.scaleY = Number(ac.eye_scale)
			}
			if (eye_offside && ac.hasOwnProperty('eye_scale')) {
				eye_offside.scaleX = eye_offside.scaleY = Number(ac.eye_scale);
			}
			if (nose && ac.hasOwnProperty('nose_scale')) {
				nose.scaleX = nose.scaleY = Number(ac.nose_scale);
			}
			if (mouth && ac.hasOwnProperty('mouth_scale')) {
				mouth.scaleX = mouth.scaleY = Number(ac.mouth_scale);
			}
			if (ear_close && ac.hasOwnProperty('ears_scale')) {
				ear_close.scaleX = ear_close.scaleY = Number(ac.ears_scale);
				if (ear_close_color) ear_close_color.scaleX = ear_close_color.scaleY = Number(ac.ears_scale);
			}
			if (back_ears && ac.hasOwnProperty('ears_scale')) {
				back_ears.scaleX = back_ears.scaleY = Number(ac.ears_scale);
				if (back_ears_color) back_ears_color.scaleX = back_ears_color.scaleY = Number(ac.ears_scale);
			}
			
			avatarContainer_mc.sideHeadContainer_mc.sideMouthContainer_mc.y = mouth_y;
			if (ac.hasOwnProperty('mouth_height')) {
				avatarContainer_mc.sideHeadContainer_mc.sideMouthContainer_mc.y+= int(ac.mouth_height);
			}
			
			avatarContainer_mc.sideHeadContainer_mc.sideNoseContainer_mc.y = nose_y;
			if (ac.hasOwnProperty('nose_height')) {
				avatarContainer_mc.sideHeadContainer_mc.sideNoseContainer_mc.y+= int(ac.nose_height);
			}
			
			avatarContainer_mc.sideHeadContainer_mc.sideEarCloseContainer_mc.y = ear_close_y;
			if (ac.hasOwnProperty('ears_height')) {
				avatarContainer_mc.sideHeadContainer_mc.sideEarCloseContainer_mc.y+= int(ac.ears_height);
			}
			
			avatarContainer_mc.sideHeadContainer_mc.sideEyeCloseContainer_mc.x = eye_close_x;
			if (ac.hasOwnProperty('eye_dist')) {
				avatarContainer_mc.sideHeadContainer_mc.sideEyeCloseContainer_mc.x-= int(ac.eye_dist);
			}
			
			avatarContainer_mc.sideHeadContainer_mc.sideEyeOffsideContainer_mc.x = eye_offside_x;
			if (ac.hasOwnProperty('eye_dist')) {
				avatarContainer_mc.sideHeadContainer_mc.sideEyeOffsideContainer_mc.x+= int(ac.eye_dist);
			}
			
			avatarContainer_mc.sideHeadContainer_mc.sideEyeCloseContainer_mc.y = eye_close_y;
			if (ac.hasOwnProperty('eye_height')) {
				avatarContainer_mc.sideHeadContainer_mc.sideEyeCloseContainer_mc.y+= int(ac.eye_height);
			}
			
			avatarContainer_mc.sideHeadContainer_mc.sideEyeOffsideContainer_mc.y = eye_offside_y;
			if (ac.hasOwnProperty('eye_height')) {
				avatarContainer_mc.sideHeadContainer_mc.sideEyeOffsideContainer_mc.y+= int(ac.eye_height);
			}
			
		}
		
		/* -----------------------------------------------------------------------------------------------------------------
		START COLORING METHODS --------------------------------------------------------------------------------------------- */
		
		private function addColorTransformToSkinColorParts(ct:ColorTransform):void {
			for (var i:int;i<skin_color_mcsA.length;i++) {
				if (this[skin_color_mcsA[i]]) this[skin_color_mcsA[i]].transform.colorTransform = ct;
			}
		}
		
		private function addColorTransformToHairColorParts(ct:ColorTransform):void {
			for (var i:int;i<hair_color_mcsA.length;i++) {
				if (this[hair_color_mcsA[i]]) this[hair_color_mcsA[i]].transform.colorTransform = ct;
			}
		}
		
		private function switchSkinVisibility(v:Boolean):void {
			for (var i:int;i<skin_mcsA.length;i++) {
				var p:MovieClip = this[skin_mcsA[i]];
				if (p) {
					p.visible = v;
					if (skin_mcsA[i] == 'skull') {
						//trace(DisplayDebug.LogCoords(p.parent, 20));
					}
				} else {
					trace(skin_mcsA[i]+ 'not exists');
				}
			}
			
			for (i=0;i<skin_color_mcsA.length;i++) {
				if (this[skin_color_mcsA[i]]) this[skin_color_mcsA[i]].visible = v;
			}
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
			// color for lower legs
			back_leg_lower_left_color = makeColorMCForSkin(new backLegLowerLeft(), 'backLegLowerLeftNakedContainer_mc', 'backLegLowerLeft_mc');
			back_leg_lower_right_color = makeColorMCForSkin(new backLegLowerRight(), 'backLegLowerRightNakedContainer_mc', 'backLegLowerRight_mc');
			// color for feet
			back_foot_left_color = makeColorMCForSkin(new backFootLeft(), 'backFootLeftContainer_mc', 'backFootLeft_mc');
			back_foot_right_color = makeColorMCForSkin(new backFootRight(), 'backFootRightContainer_mc', 'backFootRight_mc');
		}
		
		private function setSkinParts():void {
			// skull
			skull = getSkinPart('sideHeadContainer_mc', 'sideSkullContainer_mc', 'sideSkull_mc');
			// torso
			torso = getSkinPart('sideTorsoContainer_mc', 'sideTorso_mc');
			// upper arms
			arm_upper_close = getSkinPart('sideArmUpperCloseContainer_mc', 'sideArmUpperClose_mc');
			arm_upper_offside = getSkinPart('sideArmUpperOffsideContainer_mc', 'sideArmUpperOffside_mc');
			// lower harms
			arm_lower_close = getSkinPart('sideArmLowerCloseContainer_mc', 'sideArmLowerClose_mc');
			arm_lower_offside = getSkinPart('sideArmLowerOffsideContainer_mc', 'sideArmLowerOffside_mc');
			// hands
			hand_close = getSkinPart('sideHandCloseContainer_mc', 'sideHandClose_mc');
			hand_offside = getSkinPart('sideHandOffsideContainer_mc', 'sideHandOffside_mc');
			// upper legs
			leg_upper_close = getSkinPart('sideLegUpperCloseContainer_mc', 'sideLegUpperClose_mc');
			leg_upper_offside = getSkinPart('sideLegUpperOffsideContainer_mc', 'sideLegUpperOffside_mc');
			// lower legs
			leg_lower_close = getSkinPart('sideLegLowerCloseContainer_mc', 'sideLegLowerClose_mc');
			leg_lower_offside = getSkinPart('sideLegLowerOffsideContainer_mc', 'sideLegLowerOffside_mc');
			// feet
			foot_close = getSkinPart('sideFootCloseContainer_mc', 'sideFootClose_mc');
			foot_offside = getSkinPart('sideFootOffsideContainer_mc', 'sideFootOffside_mc');
			// skull
			back_skull = getSkinPart('backHeadContainer_mc', 'backHead_mc');
			// torso
			back_torso = getSkinPart('backTorsoContainer_mc', 'backTorso_mc');
			// upper arms
			back_arm_upper_left = getSkinPart('backArmUpperLeftContainer_mc', 'backArmUpperLeft_mc');
			back_arm_upper_right = getSkinPart('backArmUpperRightContainer_mc', 'backArmUpperRight_mc');
			// lower harms
			back_arm_lower_left = getSkinPart('backArmLowerLeftContainer_mc', 'backArmLowerLeft_mc');
			back_arm_lower_right = getSkinPart('backArmLowerRightContainer_mc', 'backArmLowerRight_mc');
			// hands
			back_hand_left = getSkinPart('backHandLeftContainer_mc', 'backHandLeft_mc');
			back_hand_right = getSkinPart('backHandRightContainer_mc', 'backHandRight_mc');
			// upper legs
			back_leg_upper_left = getSkinPart('backLegUpperLeftContainer_mc', 'backLegUpperLeft_mc');
			back_leg_upper_right = getSkinPart('backLegUpperRightContainer_mc', 'backLegUpperRight_mc');
			// lower legs
			back_leg_lower_left = getSkinPart('backLegLowerLeftNakedContainer_mc', 'backLegLowerLeft_mc');
			back_leg_lower_right = getSkinPart('backLegLowerRightNakedContainer_mc', 'backLegLowerRight_mc');
			// feet
			back_foot_left = getSkinPart('backFootLeftContainer_mc', 'backFootLeft_mc');
			back_foot_right = getSkinPart('backFootRightContainer_mc', 'backFootRight_mc');
		}
		
		private function makeColorMCForSkin(color_mc:MovieClip, ... path):MovieClip {
			color_mc.name = getQualifiedClassName(color_mc)+'_color';
			var p:MovieClip = avatarContainer_mc;
			
			// make sure the whole path exists before doing anything
			for (var i:int;i<path.length;i++) {
				p = p[path[i]];
				if (!p) {
					Console.warn(path[i]+' not exists');
					return null;
				}
			}
			
			// we do this check because we have to call makeColorMcsForBody on every initializeHead,
			// in order to get the back containers, which are fucked somehow, but we don't want to add extra color mcs
			if (p.parent.getChildByName(color_mc.name)) {
				//Console.warn('already has '+getQualifiedClassName(color_mc))
				return p.parent.getChildByName(color_mc.name) as MovieClip;
			}
			
			color_mc.blendMode = BlendMode.HARDLIGHT;
			p.parent.addChild(color_mc);
			
			return color_mc;
		}
		
		private function getSkinPart(... path):MovieClip {
			var p:MovieClip = avatarContainer_mc;
			
			// make sure the whole path exists before doing anything
			for (var i:int;i<path.length;i++) {
				p = p[path[i]];
				if (!p) {
					Console.warn(path[i]+' not exists');
					return null;
				}
			}
			
			return p;
		}
		
		
		private function getColorFilters(aca:AvatarConfigArticle):Object {
			if (!aca) return null;
			if (!aca.colors) return null;
			/*			color_1: {
			tintColor: 'cc0000', // hex
			brightness: 100, // [-100:100], 100 default
			saturation: 100, // [-100:100], 100 default
			contrast: 100, // [-100:100], 100 default
			tintAmount: 100 // [0 - 100], 0 default
			},
			*/
			var acac:AvatarConfigArticleColor;
			var H:Object = {};
			for (var k:String in aca.colors) {
				//Console.dir(aca.colors)
				acac = aca.colors[k] as AvatarConfigArticleColor;
				
				var cm:com.quasimondo.geom.ColorMatrix = new com.quasimondo.geom.ColorMatrix();
				cm.colorize(acac.tintColor, (acac.tintAmount) ? acac.tintAmount/100 : 0);
				cm.adjustContrast((acac.contrast) ? acac.contrast/100 : 0);
				cm.adjustSaturation(((acac.saturation) ? acac.saturation/100 : 0)+1);
				cm.adjustBrightness((acac.brightness) ? acac.brightness : 0);
				H[k] = [cm.filter];
			}
			return H;
		}
		
		private function getColorTransform(color_num:uint):ColorTransform {
			var rr:int = color_num >> 16 & 0xFF;
			var gg:int = color_num >> 8 & 0xFF;
			var bb:int = color_num & 0xFF;
			return new ColorTransform(0, 0, 0, 1, rr, gg, bb, 0);
		}
		
		private function maybeColorIt(mc:MovieClip, name:String, filtersA:Array):Boolean {
			if (!mc) return false;
			if (!mc[name]) return false;
			//info('coloring '+name)
			
			mc[name].filters = filtersA;
			return true;
		}
		
		/* END COLORING METHODS ---------------------------------------------------------------------------------------------
		------------------------------------------------------------------------------------------------------------------------------- */

		
		/* -----------------------------------------------------------------------------------------------------------------
		START ANIMATION METHODS --------------------------------------------------------------------------------------------- */

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
		
		public var all_stopped:Boolean;
		public function stopAll():void {
			avatarContainer_mc.stop();
			
			var i:int;
			for (i=0;i<back_animated_mcs.length;i++) {
				if (this[back_animated_mcs[i]]) this[back_animated_mcs[i]].stop();
			}
			for (i=0;i<side_animated_mcs.length;i++) {
				if (this[side_animated_mcs[i]]) this[side_animated_mcs[i]].stop();
			}
			all_stopped = true;
			//Console.warn('stopped')
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
			
			//Console.warn('side anim '+anim)
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
			
			//Console.warn('back anim '+anim)
		}
		
		public var current_anim:String = '';
		public function playAnimation(anim:String):void {
			if (animations.indexOf(anim)>-1) {
				if (anim == 'climb') {
					playBackAnimation(anim);
				} else {
					playSideAnimation(anim);
				}
				current_anim = anim;
				all_stopped = false;
			} else {
				Console.warn('playAnimation unkown animation: '+anim);
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
		
		/* END ANIMATION METHODS ---------------------------------------------------------------------------------------------
		------------------------------------------------------------------------------------------------------------------------------- */
		
		/* -----------------------------------------------------------------------------------------------------------------
		START GENERAL ASSET ADDING METHODS --------------------------------------------------------------------------------------------- */
		
		private function removeArticlePartFromContainer(p:MovieClip, container_name:String):void {
			var container:MovieClip = p[container_name];
			if (!container) {
				Console.warn(container_name+' is null while trying to remove article part')
				return;
			}
			while (container.numChildren) container.removeChildAt(0);
		}
		
		private function addOrRemove(part_class_name:String, aca:AvatarConfigArticle, p:MovieClip, container_name:String, colorFiltersH:Object = null):MovieClip {
			if (!aca || !aca.article_class_name || aca.article_class_name == 'none') {
				removeArticlePartFromContainer(p, container_name);
				return null;
			}
			
			return addArticlePartToContainer(part_class_name, aca, p, container_name, colorFiltersH);
		}
		
		private function addArticlePartToContainer(part_class_name:String, aca:AvatarConfigArticle, p:MovieClip, container_name:String, colorFiltersH:Object = null):MovieClip {
			var container:MovieClip = p[container_name];
			var article_part:MovieClip = arm.getArticlePartMC(aca, part_class_name);
			Console.log(89, part_class_name+' '+article_part);
			if (!article_part) article_part = new MovieClip(); 
			if (container) {
				removeArticlePartFromContainer(p, container_name);	
			} else {
				Console.warn(container_name+' is null while trying to add '+name);
				return article_part;
			}
			
			
			if (aca) {
				
				// let's look for all the color_X children this thing has!
				
				if (colors_mc_names_by_slot) {
					if (!colors_mc_names_by_slot[aca.type]) colors_mc_names_by_slot[aca.type] = [];
					var A:Array = colors_mc_names_by_slot[aca.type];
					
					for (var i:int=1;i<21;i++) {
						var color_name:String = 'color_'+i;
						if (A.indexOf(color_name) != -1) continue; // we already know about this color_X for this slot
						if (article_part[color_name]) {
							A.push(color_name);
						}
					}
				}
				
				//apply masks
				if (part_class_name.toLowerCase().indexOf('eyeclose')>-1) {
					article_part.mask = eye_close_mask;
				} else if (part_class_name.toLowerCase().indexOf('eyeoffside')>-1) {
					article_part.mask = eye_offside_mask;
				} else if (part_class_name.toLowerCase().indexOf('mouth')>-1) {
					article_part.mask = mouth_mask;
				}
			} else {
				//trace('no aca for '+part_class_name)
			}
			
			container.addChildAt(article_part, 0);
			
			if (colorFiltersH) {
				for (var k:String in colorFiltersH) {
					if (maybeColorIt(article_part, k, colorFiltersH[k])) {
						Console.log(89, part_class_name+' colored with '+k);						
					} else {
						Console.priwarn(89, part_class_name+' NOT colored with '+k);
					}
				}
			}
			
			return article_part;
		}
		
		/* END GENERAL ASSET ADDING METHODS ---------------------------------------------------------------------------------------------
		------------------------------------------------------------------------------------------------------------------------------- */
		
		/* -----------------------------------------------------------------------------------------------------------------
		START SPECIFIC ASSET ADDING METHODS --------------------------------------------------------------------------------------------- */
		
		// FIRST CLOTHES
		
		private function addShirt(aca:AvatarConfigArticle):void {
			var colorFiltersH:Object = getColorFilters(aca);
			
			var new_shirt_torso:MovieClip = addArticlePartToContainer(SHIRTTORSO, aca, avatarContainer_mc, 'sideShirtContainer_mc', colorFiltersH);
			if (new_shirt_torso) {
				shirt_torso = new_shirt_torso;
			}
			addOrRemove(BACKSHIRTTORSO, aca, avatarContainer_mc, 'backShirtContainer_mc', colorFiltersH);
			addOrRemove(SLEEVEUPPERCLOSE, aca, avatarContainer_mc, 'sideShirtSleeveUpperCloseContainer_mc', colorFiltersH);
			addOrRemove(BACKSLEEVEUPPERLEFT, aca, avatarContainer_mc, 'backSleeveUpperLeftContainer_mc', colorFiltersH);
			addOrRemove(SLEEVELOWERCLOSE, aca, avatarContainer_mc, 'sideShirtSleeveLowerCloseContainer_mc', colorFiltersH);
			addOrRemove(BACKSLEEVELOWERLEFT, aca, avatarContainer_mc, 'backSleeveLowerLeftContainer_mc', colorFiltersH);
			addOrRemove(SLEEVEUPPEROFFSIDE, aca, avatarContainer_mc, 'sideShirtSleeveUpperOffsideContainer_mc', colorFiltersH);
			addOrRemove(BACKSLEEVEUPPERRIGHT, aca, avatarContainer_mc, 'backSleeveUpperRightContainer_mc', colorFiltersH);
			addOrRemove(SLEEVELOWEROFFSIDE, aca, avatarContainer_mc, 'sideShirtSleeveLowerOffsideContainer_mc', colorFiltersH);
			addOrRemove(BACKSLEEVELOWERRIGHT, aca, avatarContainer_mc, 'backSleeveLowerRightContainer_mc', colorFiltersH);
		}
		
		private function addDress(aca:AvatarConfigArticle):void {
			var colorFiltersH:Object = getColorFilters(aca);
			
			var new_back_dress:MovieClip = addArticlePartToContainer(BACKDRESS, aca, avatarContainer_mc, 'backDressContainer_mc', colorFiltersH);
			if (new_back_dress) {
				back_dress = new_back_dress;
			}
			
			var new_dress:MovieClip = addArticlePartToContainer(DRESS, aca, avatarContainer_mc, 'sideDressContainer_mc', colorFiltersH);
			if (new_dress) {
				dress = new_dress;
			}
		}

		private function addCape(aca:AvatarConfigArticle):void {
			var colorFiltersH:Object = getColorFilters(aca);
			
			addOrRemove(CAPETIE, aca, avatarContainer_mc, 'sideCapeTieContainer_mc', colorFiltersH);
			
			var new_back_cape:MovieClip = addArticlePartToContainer(BACKCAPE, aca, avatarContainer_mc, 'backCapeContainer_mc', colorFiltersH);
			if (new_back_cape) {
				back_cape = new_back_cape;
			}
			
			var new_cape:MovieClip = addArticlePartToContainer(CAPE, aca, avatarContainer_mc, 'sideCapeContainer_mc', colorFiltersH);
			if (new_cape) {
				cape = new_cape;
			}
		}
		
		private function addSkirt(aca:AvatarConfigArticle):void {
			var colorFiltersH:Object = getColorFilters(aca);
			
			var new_back_skirt:MovieClip = addArticlePartToContainer(BACKSKIRT, aca, avatarContainer_mc, 'backDressContainer_mc', colorFiltersH);
			if (new_back_skirt) {
				back_skirt = new_back_skirt;
			}
			
			var new_skirt:MovieClip = addArticlePartToContainer(SKIRT, aca, avatarContainer_mc, 'sideDressContainer_mc', colorFiltersH);
			if (new_skirt) {
				skirt = new_skirt;
			}
		}
		
		private function addPants(aca:AvatarConfigArticle):void {
			var colorFiltersH:Object = getColorFilters(aca);
			
			addOrRemove(PANTSTOP, aca, avatarContainer_mc, 'sidePantsBottomContainer_mc', colorFiltersH);
			addOrRemove(BACKPANTSTOP, aca, avatarContainer_mc, 'backPantsBottomContainer_mc', colorFiltersH);
			addOrRemove(PANTSLEGUPPERCLOSE, aca, avatarContainer_mc, 'sidePantsUpperCloseContainer_mc', colorFiltersH);
			addOrRemove(BACKPANTSLEGUPPERLEFT, aca, avatarContainer_mc, 'backPantsUpperLeftContainer_mc', colorFiltersH);
			addOrRemove(PANTSLEGLOWERCLOSE, aca, avatarContainer_mc, 'sidePantsLowerCloseContainer_mc', colorFiltersH);
			addOrRemove(BACKPANTSLEGLOWERLEFT, aca, avatarContainer_mc, 'backPantsLowerLeftContainer_mc', colorFiltersH);
			addOrRemove(PANTSLEGUPPEROFFSIDE, aca, avatarContainer_mc, 'sidePantsUpperOffsideContainer_mc', colorFiltersH);
			addOrRemove(BACKPANTSLEGUPPERRIGHT, aca, avatarContainer_mc, 'backPantsUpperRightContainer_mc', colorFiltersH);
			addOrRemove(PANTSLEGLOWEROFFSIDE, aca, avatarContainer_mc, 'sidePantsLowerOffsideContainer_mc', colorFiltersH);
			addOrRemove(BACKPANTSLEGLOWERRIGHT, aca, avatarContainer_mc, 'backPantsLowerRightContainer_mc', colorFiltersH);
		}
		
		private function addCoat(aca:AvatarConfigArticle):void {
			var colorFiltersH:Object = getColorFilters(aca);
			
			var new_coat_side_close:MovieClip = addArticlePartToContainer(COATCLOSE, aca, avatarContainer_mc, 'sideCoatCloseContainer_mc', colorFiltersH);
			if (new_coat_side_close) {
				coat_side_close = new_coat_side_close;
			}
			var new_coat_side_offside:MovieClip = addArticlePartToContainer(COATOFFSIDE, aca, avatarContainer_mc, 'sideCoatOffsideContainer_mc', colorFiltersH);
			if (new_coat_side_offside) {
				coat_side_offside = new_coat_side_offside;
			}
			var new_coat_back:MovieClip = addArticlePartToContainer(BACKCOAT, aca, avatarContainer_mc, 'backCoatContianer_mc', colorFiltersH);
			if (new_coat_back) {
				coat_back = new_coat_back;
			}
			
			//addOrRemove(COATCLOSE, aca, avatarContainer_mc, 'sideCoatCloseContainer_mc', colorFiltersH);
			//addOrRemove(COATOFFSIDE, aca, avatarContainer_mc, 'sideCoatOffsideContainer_mc', colorFiltersH);
			//addOrRemove(BACKCOAT, aca, avatarContainer_mc, 'backCoatContianer_mc', colorFiltersH);
			addOrRemove(COATSLEEVEUPPERCLOSE, aca, avatarContainer_mc, 'sideShirtSleeveUpperCloseContainer_mc', colorFiltersH);
			addOrRemove(BACKCOATSLEEVEUPPERLEFT, aca, avatarContainer_mc, 'backSleeveUpperLeftContainer_mc', colorFiltersH);
			addOrRemove(COATSLEEVELOWERCLOSE, aca, avatarContainer_mc, 'sideShirtSleeveLowerCloseContainer_mc', colorFiltersH);
			addOrRemove(BACKCOATSLEEVELOWERLEFT, aca, avatarContainer_mc, 'backSleeveLowerLeftContainer_mc', colorFiltersH);
			addOrRemove(COATSLEEVEUPPEROFFSIDE, aca, avatarContainer_mc, 'sideShirtSleeveUpperOffsideContainer_mc', colorFiltersH);
			addOrRemove(BACKCOATSLEEVEUPPERRIGHT, aca, avatarContainer_mc, 'backSleeveUpperRightContainer_mc', colorFiltersH);
			addOrRemove(COATSLEEVELOWEROFFSIDE, aca, avatarContainer_mc, 'sideShirtSleeveLowerOffsideContainer_mc', colorFiltersH);
			addOrRemove(BACKCOATSLEEVELOWERRIGHT, aca, avatarContainer_mc, 'backSleeveLowerRightContainer_mc', colorFiltersH);
		}
		
		private function addShoe(aca:AvatarConfigArticle):void {
			var colorFiltersH:Object = getColorFilters(aca);
			
			addOrRemove(SHOECLOSE, aca, avatarContainer_mc, 'sideShoeCloseContainer_mc', colorFiltersH);
			addOrRemove(BACKSHOELEFT, aca, avatarContainer_mc, 'backShoeLeftContainer_mc', colorFiltersH);
			addOrRemove(SHOEOFFSIDE, aca, avatarContainer_mc, 'sideShoeOffsideContainer_mc', colorFiltersH);
			addOrRemove(BACKSHOERIGHT, aca, avatarContainer_mc, 'backShoeRightContainer_mc', colorFiltersH);
		}
		
		private function addGlove(aca:AvatarConfigArticle):void {
			var colorFiltersH:Object = getColorFilters(aca);
			
			addOrRemove(GLOVECLOSE, aca, avatarContainer_mc, 'sideGloveCloseContainer_mc', colorFiltersH);
			addOrRemove(GLOVEOFFSIDE, aca, avatarContainer_mc, 'sideGloveOffsideContainer_mc', colorFiltersH);
		}
		
		private function addSocks(aca:AvatarConfigArticle):void {
			var colorFiltersH:Object = getColorFilters(aca);
			
			addOrRemove(SOCKCLOSE, aca, avatarContainer_mc, 'sideSockCloseContainer_mc', colorFiltersH);
			addOrRemove(SOCKOFFSIDE, aca, avatarContainer_mc, 'sideSockOffsideContainer_mc', colorFiltersH);
		}	
		
		private function addRing(aca:AvatarConfigArticle):void {
			var colorFiltersH:Object = getColorFilters(aca);
			
			addOrRemove(RING, aca, avatarContainer_mc, 'sideRingCloseContainer_mc', colorFiltersH);
		}
		
		private function addNecklace(aca:AvatarConfigArticle):void {
			var colorFiltersH:Object = getColorFilters(aca);
			
			addOrRemove(NECKLACE, aca, avatarContainer_mc, 'sideNecklaceContainer_mc', colorFiltersH);
		}
		
		private function addBracelet(aca:AvatarConfigArticle):void {
			var colorFiltersH:Object = getColorFilters(aca);
			
			addOrRemove(BRACELETCLOSE, aca, avatarContainer_mc, 'sideBraceletCloseContainer_mc', colorFiltersH);
			addOrRemove(BACKBRACELETRIGHT, aca, avatarContainer_mc, 'backBraceletRightContainer_mc', colorFiltersH);
		}
		
		private function addHat(aca:AvatarConfigArticle):void {
			var colorFiltersH:Object = getColorFilters(aca);
			
			var new_back_hat:MovieClip = addArticlePartToContainer(BACKHAT, aca, avatarContainer_mc, 'backHatContainer_mc', colorFiltersH);
			if (new_back_hat) {
				back_hat = new_back_hat;
			}
			
			var new_hat:MovieClip = addArticlePartToContainer(SIDEHAT, aca, avatarContainer_mc.sideHeadContainer_mc, 'sideHatContainer_mc', colorFiltersH);
			if (new_hat) {
				hat = new_hat;
			}
		}
		
		// SECOND BODY PARTS

		private function addEyes(aca:AvatarConfigArticle):void {
			var new_eye_close:MovieClip = addArticlePartToContainer(SIDEEYECLOSE, aca, avatarContainer_mc.sideHeadContainer_mc, 'sideEyeCloseContainer_mc');
			if (new_eye_close) eye_close = new_eye_close;
			// TODO gotoAndPlay on the new asset to set it to the same frame as avatarContainer_mc
			
			var new_eye_offside:MovieClip = addArticlePartToContainer(SIDEEYEOFFSIDE, aca, avatarContainer_mc.sideHeadContainer_mc, 'sideEyeOffsideContainer_mc');
			if (new_eye_offside) eye_offside = new_eye_offside;
			// TODO gotoAndPlay on the new asset to set it to the same frame as avatarContainer_mc
		}
		
		private function addEars(aca:AvatarConfigArticle):void {
			var new_ear:MovieClip = addOrRemove(SIDEEARCLOSE, aca, avatarContainer_mc.sideHeadContainer_mc, 'sideEarCloseContainer_mc');
			ear_close = new_ear
			if (new_ear) {
				if (arm.articlePartExists(aca, SIDEEARCLOSE) && avatarContainer_mc.sideHeadContainer_mc.sideEarCloseContainer_mc) {
					ear_close_color = avatarContainer_mc.sideHeadContainer_mc.sideEarCloseContainer_mc.addChild(arm.getArticlePartMC(aca, SIDEEARCLOSE)) as MovieClip;
					ear_close_color.blendMode = BlendMode.HARDLIGHT;
				}
			}
			
			var new_back_ears:MovieClip = addOrRemove(BACKEARS, aca, avatarContainer_mc, 'backEarsContainer_mc');
			back_ears = new_back_ears;
			if (new_back_ears) {
				if (arm.articlePartExists(aca, BACKEARS) && avatarContainer_mc.backEarsContainer_mc) {
					back_ears_color = avatarContainer_mc.backEarsContainer_mc.addChild(arm.getArticlePartMC(aca, BACKEARS)) as MovieClip;
					back_ears_color.blendMode = BlendMode.HARDLIGHT;
				}
			}
		}
		
		private function addNose(aca:AvatarConfigArticle):void {
			nose = addOrRemove(SIDENOSE, aca, avatarContainer_mc.sideHeadContainer_mc, 'sideNoseContainer_mc');
		}
		
		private function addHair(aca:AvatarConfigArticle):void {
			var new_back_hair:MovieClip = addArticlePartToContainer(BACKHAIR, aca, avatarContainer_mc, 'backHairContainer_mc');
			if (new_back_hair) {
				back_hair = new_back_hair;
				if (arm.articlePartExists(aca, BACKHAIR) && avatarContainer_mc.backHairContainer_mc) {
					back_hair_color = avatarContainer_mc.backHairContainer_mc.addChild(arm.getArticlePartMC(aca, BACKHAIR)) as MovieClip;
					back_hair_color.blendMode = BlendMode.OVERLAY;
				}
			}
			
			var new_hair:MovieClip = addArticlePartToContainer(SIDEHAIR, aca, avatarContainer_mc.sideHeadContainer_mc, 'sideHairContainer_mc');
			if (new_hair) {
				hair = new_hair;
				if (arm.articlePartExists(aca, SIDEHAIR)) {
					hair_color = avatarContainer_mc.sideHeadContainer_mc.sideHairContainer_mc.addChild(arm.getArticlePartMC(aca, SIDEHAIR)) as MovieClip;
					hair_color.blendMode = BlendMode.OVERLAY;
					//hair_color.x = -50
				}
			}
			
			// TODO gotoAndPlay on the new asset to set it to the same frame as avatarContainer_mc
		}
		
		private function addMouth(aca:AvatarConfigArticle):void {
			var new_mouth:MovieClip = addArticlePartToContainer(SIDEMOUTH, aca, avatarContainer_mc.sideHeadContainer_mc, 'sideMouthContainer_mc');
			if (new_mouth) mouth = new_mouth;
			// TODO gotoAndPlay on the new asset to set it to the same frame as avatarContainer_mc
		}
		
	}
}
