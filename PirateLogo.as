package {
	import flash.system.*;
	import flash.display.*;
	import flash.filters.*;
	import flash.net.* ;
	import flash.events.*;
	import flash.utils.*;
	import flash.geom.*;
	import data.*;
	//import data.text;
	import api.MD5;
	import adobe.PNGEncoder;
	import com.adobe.serialization.json.JSON;

	public class PirateLogo extends Sprite{
		
private var myBevel:BevelFilter;
private var user_photo:Loader;
private var save_text:text;
private var loader:URLLoader;
private var request:URLRequest;
public var wrapper: Object;
public var serv:String;
private var save_button:Sprite;
private var myShadow:DropShadowFilter;
private var save_button_color:uint;
private var viewer_id:int;
private var api_id:String;
private var api_secret:String;

		public function PirateLogo() {
			
			 
			 this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			}
		
		public function onAddedToStage(e: Event): void {
    			wrapper = Object(this.parent.parent);
    			
    		viewer_id = stage.loaderInfo.parameters.viewer_id;
    		api_id = "1955614";
    		api_secret = 'kMqXujL3CT';
    		
    			serv = "http://62.76.177.54/woff_images/pirate/";
				
    		var context:LoaderContext = new LoaderContext();
				context.checkPolicyFile = true;
			
			myShadow = new DropShadowFilter();
				myShadow.blurX = 5;
				myShadow.blurY = 5;
				myShadow.quality = 10;
				myShadow.inner = true;
				
			var myShadow2 = new DropShadowFilter();
				//myShadow2.blurX = 5;
				//myShadow2.blurY = 5;
				myShadow2.quality = 5;
				
				save_button_color = 0xFF6666;
						
			var logo:Loader = new Loader();
				logo.load(new URLRequest(serv +"Logo.png"), context);
				logo.x = 240;
				logo.y = 15;
				logo.filters = [myShadow2];
				addChild(logo);
				 
				 
			// ----------------------------------------------------------- /////////////
			var version:text = new text(290, 113, "Version 0.1", "1");
				addChild(version);
			// -----------------------------------------------------------////////////////
			
				
			var avatar_shape:Sprite = new Sprite();
			avatar_shape.graphics.beginFill(0xFFFFFF,1);
			avatar_shape.graphics.lineStyle(0.8);
			avatar_shape.graphics.drawRoundRect(20, 25, 220, 525, 14);
			avatar_shape.filters = [myShadow];
				addChild(avatar_shape);
				
			var add_shape:Sprite = new Sprite();
			add_shape.graphics.beginFill(0xffffFF,1);
			add_shape.graphics.lineStyle(0.8);
			add_shape.graphics.drawRoundRect(280, 130, 320, 280, 25);
			add_shape.filters = [myShadow];
				addChild(add_shape);
			
			
			save_button = new Sprite();
			save_button.graphics.beginFill(0xffffFF,1);
			save_button.graphics.lineStyle(0.8);
			save_button.graphics.drawRoundRect(370, 420, 150, 40, 25);
			save_button.filters = [myShadow];
			save_button.addEventListener(MouseEvent.MOUSE_OVER, mouseOverSave);
			save_button.addEventListener(MouseEvent.MOUSE_OUT, mouseOutSave);
			save_button.addEventListener(MouseEvent.CLICK, saveClickEvent);
			
					addChild(save_button);
			
			save_text = new text(445, 430, "Готово! загрузить!", "ads_well");
			save_text.addEventListener(MouseEvent.CLICK, saveClickEvent);
			save_text.addEventListener(MouseEvent.MOUSE_OVER, mouseOverSave);
			//save_button.addEventListener(MouseEvent.MOUSE_OUT, mouseOutSave);
				addChild(save_text);
			
			//save_text.setText(api_secret + "-" + api_id);
			
			var buttons_array:Array = new Array();
				var bn:int = 30;
			
			buttons_array[1] = new button(300, 150, serv, "bay_s.png", "bay.png");
			buttons_array[2] = new button(300, 200, serv, "ppr_s.jpg", "ppr.jpg");
			buttons_array[3] = new button(300, 250, serv, "ppr2_s.jpg", "ppr2.jpg");
			buttons_array[4] = new button(300, 300, serv, "Logo(2)_s.png", "Logo(2).png");
			buttons_array[5] = new button(300, 350, serv, "pprflag_s.png", "pprflag.png");
			
			buttons_array[6] = new button(350, 150, serv, "Logo(8)_s.jpg", "Logo(8).jpg");
			buttons_array[7] = new button(350, 200, serv, "Logo_m_s.png", "Logo_m.png");
			buttons_array[8] = new button(350, 250,	serv, "Logo(7)_s.jpg", "Logo(7).jpg");
			buttons_array[9] = new button(350, 300, serv, "Logo(9)_s.png", "Logo(9).png");
			buttons_array[10] = new button(350, 350, serv, "Logo(5)_s.jpg", "Logo(5).jpg");
			
			buttons_array[11] = new button(400, 150, serv, "club_logo_s.jpg", "club_logo.jpg");
			buttons_array[12] = new button(400, 200, serv, "Logo(13)_s.jpg", "Logo(13).jpg");
			buttons_array[13] = new button(400, 250, serv, "Logo(16)_s.jpg", "Logo(16).jpg");
			buttons_array[14] = new button(400, 300, serv, "pic7_s.jpg", "pic7.jpg");
			buttons_array[15] = new button(400, 350, serv, "pic8_s.jpg", "pic8.jpg");
			
			buttons_array[16] = new button(450, 150, serv, "Logo(18)_s.jpg", "Logo(18).jpg");
			buttons_array[17] = new button(450, 200, serv, "Logo(12)_s.jpg", "Logo(12).jpg");
			buttons_array[18] = new button(450, 250, serv, "bay_s.png", "bay.png");
			buttons_array[19] = new button(450, 300, serv, "bay_s.png", "bay.png");
			buttons_array[20] = new button(450, 350, serv, "pic9_s.jpg", "pic9.jpg");
			
			buttons_array[21] = new button(500, 150, serv, "pic10_s.jpg", "pic10.jpg");
			buttons_array[22] = new button(500, 200, serv, "pic11_s.jpg", "pic11.jpg");	
			buttons_array[23] = new button(500, 250, serv, "pic12_s.jpg", "pic12.jpg");
			buttons_array[24] = new button(500, 300, serv, "pic13_s.jpg", "pic13.jpg");
			buttons_array[25] = new button(500, 350, serv, "pic14_s.jpg", "pic14.jpg");
			
			buttons_array[26] = new button(550, 150, serv, "pic15_s.jpg", "pic15.jpg");
			buttons_array[27] = new button(550, 200, serv, "pic16_s.jpg", "pic16.jpg");
			buttons_array[28] = new button(550, 250, serv, "kepka3_s.jpg", "kepka3.jpg");
			buttons_array[29] = new button(550, 300, serv, "kepka2_s.jpg", "kepka2.jpg");
			buttons_array[30] = new button(550, 350, serv, "kepka_s.jpg", "kepka.jpg");	
		
			for (var ii:int = 1; ii <= bn; ii++) {
				addChild(buttons_array[ii]);
			}
				
		// запрос аватарки		 
		//var api_id:String = "1955614";
		//var viewer_id = stage.loaderInfo.parameters.viewer_id;
		//var api_secret:String = 'kMqXujL3CT';
		var test_mode:Number = 1;
	
		var methodFromAPI = "getProfiles";
		
		var _sig:String = viewer_id + 'api_id='+api_id+'fields=photo_bigmethod='+methodFromAPI+'test_mode='+test_mode+'uids='+ viewer_id +'v=2.0'+ api_secret;
		var sig:String = MD5.encrypt(_sig); // используем метод hash класса md5 и получаем сигнатуру
		
		var request = new URLRequest("http://api.vkontakte.ru/api.php");
  		request.method = URLRequestMethod.GET;
  		
  		var v:URLVariables = new URLVariables();
  		v.api_id = api_id;
		v.v = "2.0"; // Версия АПИ
		v.method = methodFromAPI;
		v.uids = viewer_id;
		v.test_mode = test_mode;
		v.sig = sig;
		v.fields = "photo_big";
	
   		request.data = v;
          
		var loader222:URLLoader = new URLLoader();
		loader222.dataFormat = URLLoaderDataFormat.TEXT;
		loader222.addEventListener(Event.COMPLETE, loadVkComplete);
		loader222.load(request);
		
		
		}
		
		public function loadVkComplete(e:Event):void {
	
			var answer= new XML(e.target.data);
			answer.ignoreWhite = true;
			
			var context:LoaderContext = new LoaderContext();
				context.checkPolicyFile = true;
				
			user_photo = new Loader();
			user_photo.load(new URLRequest(answer.user[0].photo_big.text()), context);
			user_photo.x = 30;
			user_photo.y = 35;
			//user_photo.addEventListener(MouseEvent.CLICK, doit);
			addChildAt(user_photo, 3);
			
			}
			
		// функция загрузки адреса сервера для сохранения	
		public function saveClickEvent(e:MouseEvent):void {
			
			//var api_id:String = "1955614";
		//var viewer_id = stage.loaderInfo.parameters.viewer_id;
		//var api_secret:String = 'kMqXujL3CT';
		var test_mode:Number = 0;
	
		var methodFromAPI = "photos.getProfileUploadServer";
		
		var _sig:String = viewer_id + 'api_id='+api_id+'method='+methodFromAPI+'test_mode='+test_mode+'v=2.0'+ api_secret;
		var sig:String = MD5.encrypt(_sig); // используем метод hash класса md5 и получаем сигнатуру
		
		var request = new URLRequest("http://api.vkontakte.ru/api.php");
  		request.method = URLRequestMethod.GET;
  		
  		var v:URLVariables = new URLVariables();
  		v.api_id = api_id;
		v.v = "2.0"; // Версия АПИ
		v.method = methodFromAPI;
		//v.uids = viewer_id;
		v.test_mode = test_mode;
		v.sig = sig;
		//v.fields = "photo_big";
	
   		request.data = v;
          
		var loader222:URLLoader = new URLLoader();
		loader222.dataFormat = URLLoaderDataFormat.TEXT;
		loader222.addEventListener(Event.COMPLETE, loadUploadServerComplete);
		loader222.load(request);
		
		//save_text.setText("loaded");
		
		}
		
		// функция отрисовки и загрузки аватарки на сервер контакта
		public function loadUploadServerComplete(e:Event):void {
				Security.allowDomain("*");
			
			var answer= new XML(e.target.data);
			save_text.setText("server load");
			
			var raw:BitmapData = new BitmapData(stage.width, stage.height);
				raw.draw(stage);
				
			var newPhoto:BitmapData = new BitmapData(200, 500);
				newPhoto.copyPixels(raw, new Rectangle(30, 35, 200, 500), new Point(0, 0));
			
      		var brr:ByteArray = PNGEncoder.encode(newPhoto);
      		
      		var boundary:String = "blablabla-spycom";
			var header1:* = "\r\n--" + boundary + "\r\n" + "Content-Disposition: form-data; name=\"photo\"; filename=\"photo.png\"\r\n" + "Content-Type: image/png\r\n\r\n" + "";
			var header2:* = "--" + boundary + "\r\n" + "Content-Disposition: form-data; name=\"Upload\"\r\n\r\n" + "Submit Query\r\n" + "--" + boundary + "--";
			var headerBytes1:* = new ByteArray();
				headerBytes1.writeMultiByte(header1, "ascii");
			var headerBytes2:* = new ByteArray();
				headerBytes2.writeMultiByte(header2, "ascii");
			
			
			
			var sendBytes:ByteArray = new ByteArray();
			sendBytes.writeBytes(headerBytes1, 0, headerBytes1.length);
			sendBytes.writeBytes(brr, 0, brr.length);
			sendBytes.writeBytes(headerBytes2, 0, headerBytes2.length);
			
			
			
      		//var api_id:String = "1955614";
		//var viewer_id = stage.loaderInfo.parameters.viewer_id;
		//var api_secret:String = 'kMqXujL3CT';
		var test_mode:Number = 1;
			
		request = new URLRequest(answer.upload_url.text());
  		request.method = URLRequestMethod.POST;
  		request.contentType = "multipart/form-data; boundary=" + "blablabla-spycom";
   		request.data = sendBytes;
   		
   		//save_text.setText("wtf!!!!");
         
		loader = new URLLoader();
		//loader222.dataFormat = URLLoaderDataFormat.BINARY;
		loader.addEventListener(Event.COMPLETE, loadPhotoComplete);
		//loader222.load(request);
		//doit(null);
		save_text.setText("Ура, теперь СОХРАНИТЬ!");
		save_text.removeEventListener(MouseEvent.CLICK, saveClickEvent);
		save_text.addEventListener(MouseEvent.CLICK, doit);
		save_button.removeEventListener(MouseEvent.CLICK, saveClickEvent);
		save_button.addEventListener(MouseEvent.CLICK, doit);
		
		save_button_color = 0x33FF66;
		
		//var myGlow:GlowFilter = new GlowFilter();
			//	myGlow.color = 0xFF6666;
				
			save_button.graphics.beginFill(save_button_color,1);
			save_button.graphics.lineStyle(0.8);
			save_button.graphics.drawRoundRect(370, 420, 150, 40, 25);
			save_button.filters = [myShadow];
				
		}
		
		public function doit(e:MouseEvent):void{
			loader.load(request);
		}
		 
		 
		// функуия окончания загрузки на сервер ВК и отправка хэша
		private function loadPhotoComplete(e:Event):void {
			//save_text.setText("PhotoCmpl");
			
			var json_data:Object=com.adobe.serialization.json.JSON.decode(e.target.data);
			
			//save_text.setText(e.target.data);
			
			//var api_id:String = "1955614";
			//var viewer_id = stage.loaderInfo.parameters.viewer_id;
			//var api_secret:String = 'kMqXujL3CT';
			var test_mode:Number = 1;
	
			var methodFromAPI = "photos.saveProfilePhoto";
		
			var _sig:String = viewer_id + 'api_id='+api_id+'hash='+json_data.hash+'method='+methodFromAPI+'photo='+json_data.photo+'server='+json_data.server+'test_mode='+test_mode+'v=2.0'+ api_secret;
			var sig:String = MD5.encrypt(_sig); // используем метод hash класса md5 и получаем сигнатуру
		
			var request = new URLRequest("http://api.vkontakte.ru/api.php");
  			request.method = URLRequestMethod.POST;
  		
  			var v:URLVariables = new URLVariables();
  			v.api_id = api_id;
			v.v = "2.0"; // Версия АПИ
			v.method = methodFromAPI;
			//v.uids = viewer_id;
			v.test_mode = test_mode;
			v.sig = sig;
  			v.server = json_data.server;
			v.photo = json_data.photo;
			v.hash = json_data.hash;
	
   			request.data = v;
          
			var loader222:URLLoader = new URLLoader();
			//loader222.dataFormat = URLLoaderDataFormat.TEXT;
			loader222.addEventListener(Event.COMPLETE, loadHashComplete);
			loader222.load(request);
			
			
			
			
		}
		
		// подтвержение замены
		private function  loadHashComplete(e:Event):void {
			save_text.setText("Сохранено!");
			save_text.addEventListener(MouseEvent.CLICK, saveClickEvent);
			save_text.removeEventListener(MouseEvent.CLICK, doit);
			save_button.addEventListener(MouseEvent.CLICK, saveClickEvent);
			save_button.removeEventListener(MouseEvent.CLICK, doit);
			
			var answer= new XML(e.target.data);
			//save_text.setText(answer);
			wrapper.external.showProfilePhotoBox(answer.photo_hash.text());
			
			save_button_color = 0xFF6666;
			
			setStatus("а ТЫ поддерживаешь Пиратскую Партию? http://vkontakte.ru/app1955614");
		}
		
		private function mouseOverSave(e:MouseEvent):void {
			var myGlow:GlowFilter = new GlowFilter();
				myGlow.color = 0xFF6666;
				
			save_button.graphics.beginFill(save_button_color,1);
			save_button.graphics.lineStyle(0.8);
			save_button.graphics.drawRoundRect(370, 420, 150, 40, 25);
			save_button.filters = [myShadow, myGlow];
		}
		
		private function mouseOutSave(e:MouseEvent):void {
			var myGlow:GlowFilter = new GlowFilter();
				myGlow.color = 0x9999FF;
				
			save_button.graphics.beginFill(0xffffff,1);
			save_button.graphics.lineStyle(0.8);
			save_button.graphics.drawRoundRect(370, 420, 150, 40, 25);	
			save_button.filters = [myShadow];
			
			 
		}
		
		private function setStatus(status_text:String):void {
			var test_mode:Number = 1;
			var methodFromAPI = "activity.set";
		
			var _sig:String = viewer_id + 'api_id='+api_id+'method='+methodFromAPI+'test_mode='+test_mode+'text='+status_text+'v=2.0'+ api_secret;
			var sig:String = MD5.encrypt(_sig); // используем метод hash класса md5 и получаем сигнатуру
		
			var request = new URLRequest("http://api.vkontakte.ru/api.php");
  			request.method = URLRequestMethod.POST;
  		
  			var v:URLVariables = new URLVariables();
  			v.api_id = api_id;
			v.v = "2.0"; // Версия АПИ
			v.method = methodFromAPI;
			//v.uids = viewer_id;
			v.test_mode = test_mode;
			v.sig = sig;
  			v.text = status_text;
			//v.photo = json_data.photo;
			//v.hash = json_data.hash;
	
   			request.data = v;
          
			var loader2222:URLLoader = new URLLoader();
			//loader222.dataFormat = URLLoaderDataFormat.TEXT;
			loader2222.addEventListener(Event.COMPLETE, loadStatusComplete);
			loader2222.load(request);
		}
		private function loadStatusComplete(e:Event):void {
			//var answer= new XML(e.target.data);
			//save_text.setText(answer);
			
		}
	}
}