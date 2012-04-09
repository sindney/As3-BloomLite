package bloom.components 
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	
	import bloom.core.Margin;
	import bloom.core.ThemeBase;
	import bloom.styles.ListStyle;
	
	/**
	 * List
	 */
	public class List extends ScrollContainer {
		
		public static var pool:Vector.<ToggleButton>;
		
		public static function getToggleButton():ToggleButton {
			if (pool.length > 0) return pool.pop();
			return new ToggleButton();
		}
		
		public static function returnToggleButton(value:ToggleButton):void {
			value.title.text = "";
			value.valueChanged.removeAll();
			value.mouseClick.removeAll();
			value.icon = null;
			if (value.parent) value.parent.removeChild(value);
			pool.push(value);
		}
		
		private var _autoScale:Boolean;
		private var _contentWidth:Number;
		private var _contentHeight:Number;
		private var _contentMargin:Margin;
		
		private var _group:CheckBoxGroup;
		private var _data:Array;
		private var _contents:Vector.<ToggleButton>;
		
		public function List(p:DisplayObjectContainer = null, data:Array = null) {
			super(p);
			
			_autoScale = true;
			_contentWidth = 100;
			_contentHeight = 20;
			_contentMargin = new Margin(2, 2, 2, 2);
			
			_group = new CheckBoxGroup( -1);
			_contents = new Vector.<ToggleButton>();
			if (!pool) pool = new Vector.<ToggleButton>();
			
			style = ThemeBase.theme.list;
			
			h_scrollBar_enabled = false;
			
			_data = data;
			
			drawDirectly();
		}
		
		/**
		 * Call this when data is modified.
		 */
		override public function update():void {
			if (!_data) return;
			
			var length:int = _contents.length;
			var needs:int = _data.length - length;
			
			var i:int;
			var button:ToggleButton;
			
			if (needs > 0) {
				for (i = 0; i < needs; i++) {
					button = getToggleButton();
					_group.addChild(button);
					_contents.push(button);
					content.addChild(button);
				}
			} else if (needs < 0) {
				for (i = 0; i < -needs; i++) {
					button = _contents.pop();
					_group.removeChild(button);
					returnToggleButton(button);
				}
			}
			
			length = _contents.length;
			
			for (i = 0; i < length; i++) {
				button = _contents[i];
				button.title.text = _data[i][0];
				button.icon = _data[i][1];
				button.lock = true;
				button.style = (_style as ListStyle).content;
				button.margin.copyForm(_contentMargin);
				button.height = _contentHeight;
				if (_autoScale) {
					button.width = _width;
					if (v_scrollBar_enabled) button.width -= v_scrollBar.width + _contentMargin.right + _contentMargin.left;
				} else {
					button.width = _contentWidth;
				}
			}
			
			super.update();
			calculateContentSize();
		}
		
		override public function dispose():void {
			super.dispose();
			var button:ToggleButton;
			_group.dispose();
			for each(button in _contents) {
				returnToggleButton(button);
			}
			_data = null;
			_contents = null;
		}
		
		override protected function onThemeChanged():void {
			if (!_lock) {
				style = ThemeBase.theme.list;
				update();
			}
		}
		
		override protected function draw(e:Event):void {
			if (!_changed) return;
			_changed = false;
			
			var style:ListStyle = _style as ListStyle;
			if (background) background.dispose();
			
			style.container.background.setSize(_width, _height);
			background = style.container.background.bitmapData.clone();
			
			_bg.graphics.clear();
			_bg.graphics.beginBitmapFill(background);
			_bg.graphics.drawRect(0, 0, _width, _height);
			_bg.graphics.endFill();
			
			h_scrollBar.style = style.container.h_scrollBar;
			v_scrollBar.style = style.container.v_scrollBar;
			
			setScrollBar(h_scrollBar_enabled, v_scrollBar_enabled);
			
			update();
		}
		
		///////////////////////////////////
		// getter/setters
		///////////////////////////////////
		
		public function get data():Array {
			return _data;
		}
		
		/**
		 * [[title, icon], [title, icon]]
		 */
		public function set data(value:Array):void {
			if (_data != value) {
				_data = value;
				_changed = true;
				invalidate();
			}
		}
		
		public function get contentMargin():Margin {
			return _contentMargin;
		}
		
		public function get contentHeight():Number {
			return _contentHeight;
		}
		
		public function set contentHeight(value:Number):void {
			if (_contentHeight != value) {
				_contentHeight = value;
				_changed = true;
				invalidate();
			}
		}
		
		public function get contentWidth():Number {
			return _contentWidth;
		}
		
		public function set contentWidth(value:Number):void {
			if (_contentWidth != value) {
				_contentWidth = value;
				_changed = true;
				invalidate();
			}
		}
		
		public function get autoScale():Boolean {
			return _autoScale;
		}
		
		public function set autoScale(value:Boolean):void {
			if (_autoScale != value) {
				_autoScale = value;
				_changed = true;
				invalidate();
			}
		}
		
		public function get group():CheckBoxGroup {
			return _group;
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.components.List]";
		}
		
	}

}