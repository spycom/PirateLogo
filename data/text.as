package data {
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;



	public class text extends Sprite {
		
		[Embed(source='/Users/spycom/dev/FF/fonts/calibri.ttf', fontFamily="Calibri", fontStyle="normal", embedAsCFF="false")]
		private static var CalibriFont:Class; //Ембедим кирилицу

		private var formatter:TextFormat = new TextFormat();
		private var top:TextField = new TextField();
		public var id:int = new int;
		public var text2:String;
		public var full:String;
		
		public function text(menu_x:int,menu_y:int,top_str:String, type:String) {
		 	id = 0;
			full = "-";
			
		top.text = top_str;
		text2 = top_str;
		
		// обычный шрифт
		if (type == "1") {
			formatter.color = 0x0389af;
			formatter.size = 13;
			formatter.italic = true;
			top.selectable = false;
			top.autoSize = TextFieldAutoSize.CENTER;
		}
		// душный
		if (type == "2") {
			formatter.color = 0x666666;
			formatter.size = 11;
			top.selectable = false;
			top.autoSize = TextFieldAutoSize.LEFT;
		}
		// душный побольше
		if (type == "3") {
			formatter.color = 0x666666;
			formatter.size = 12;
			formatter.bold = true;
			top.selectable = false;
			top.autoSize = TextFieldAutoSize.LEFT;
		}
		if (type == "31") {
			formatter.color = 0x666666;
			formatter.size = 12;
			//formatter.bold = true;
			formatter.italic = true;
			top.selectable = false;
			top.autoSize = TextFieldAutoSize.LEFT;
		}
		
		if (type == "4") {
			formatter.color = 0xE1E1E1;
			formatter.size = 11;
			top.selectable = false;
			top.autoSize = TextFieldAutoSize.LEFT;
		}
		
		if (type == "41") {
			formatter.color = 0xE1E1E1;
			formatter.size = 11;
			//formatter.italic = true;
			top.selectable = false;
			top.autoSize = TextFieldAutoSize.CENTER;
		}
		// строка ввода
		if (type == "5") {
			formatter.color = 0x666666;
			formatter.size = 11;
			top.type = TextFieldType.INPUT;
			//top.
			top.width = 187;
			top.height = 20;
			top.maxChars = 39;
			top.restrict = "A-z,А-я,0-9, ";
		}
		// текст ошибок и на странице с лигами
		if (type == "6") {
			formatter.color = 0x666666;
			formatter.size = 11;
			top.wordWrap = true;
			top.width = 282;
			top.height = 220;
			top.selectable = false;
			//top.autoSize = TextFieldAutoSize.CENTER;
		}
		if (type == "7") {
			formatter.color = 0xed1e79;
			formatter.size = 11;
			top.selectable = false;
			top.autoSize = TextFieldAutoSize.LEFT;
		}
		if (type == "8") {
			formatter.color = 0xf48120;
			formatter.size = 11;
			top.selectable = false;
			top.autoSize = TextFieldAutoSize.LEFT;
		}
		// шрифт названия команды в списке лидеров
		if (type == "9") {
			formatter.color = 0x333333;
			formatter.size = 13;
			formatter.bold = true;
			top.selectable = false;
			top.autoSize = TextFieldAutoSize.LEFT;
		}
		
		// текст правил
		if (type == "rules") {
			formatter.color = 0x666666;
			formatter.size = 11;
			top.selectable = false;
			//top.autoSize = TextFieldAutoSize.LEFT;
			top.wordWrap = true;
			top.height = 3000;
			top.width = 600;
			top.text = "";
			
			
		}
		// текст очков, центрированный по правому краю
		if (type == "11") {
			formatter.color = 0x666666;
			formatter.size = 11;
			top.selectable = false;
			top.autoSize = TextFieldAutoSize.RIGHT;
		}
		
		// текст очков, центрированный по центру
		if (type == "12") {
			formatter.color = 0x666666;
			formatter.size = 11;
			
			top.autoSize = TextFieldAutoSize.CENTER;
			//top.wordWrap = true;
			top.width = 282;
			top.height = 220;
			top.selectable = false;
		}
		
		// подсказки
		if (type == "13") {
			formatter.color = 0x666666;
			formatter.size = 11;
			
			top.autoSize = TextFieldAutoSize.CENTER;
			top.wordWrap = true;
			top.width = 60;
			top.height = 50;
			top.selectable = false;
		}
		// помельче
		if (type == "small") {
			formatter.color = 0x666666;
			formatter.size = 10;
			top.selectable = false;
			top.autoSize = TextFieldAutoSize.LEFT;
		}
		//  текс рекламы - приветствие 
		if (type == "ads_well") {
			formatter.color = 0x666666;
			formatter.size = 13;
			top.selectable = false;
			top.autoSize = TextFieldAutoSize.CENTER;
		}		
		top.embedFonts = true;
		formatter.font = "Calibri";
		//top.antiAliasType = AntiAliasType.ADVANCED;
		
		
		
		top.x = menu_x;
		top.y = menu_y;
		top.defaultTextFormat = formatter;
		top.setTextFormat(formatter);
			addChild(top);
				
		addEventListener(MouseEvent.CLICK, clickhandler);
		
		}
		public function setColor(color:String):void {
			formatter.color = color;
			top.setTextFormat(formatter);
		}
		
		public function setText(texts:String):void {
			top.text = texts;
			top.setTextFormat(formatter);
		}
		public function txt():String {
			return top.text;
			
		}
		
		public function clickhandler(e:MouseEvent):void {
			var ee:Event = new Event(Event.COMPLETE); 
                        dispatchEvent(ee); 
			
		}
		public function setId(id_:int):void {
			id = id_;
		}
		public function setFull(new_full:String):void {
			full = new_full;
		}
	}
}