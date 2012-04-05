package  
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	import bloom.components.*;
	import bloom.core.ScaleBitmap;
	import bloom.core.ThemeBase;
	import bloom.styles.ContainerStyle;
	import bloom.themes.BlueTheme;
	
	public class WindowDemo extends Sprite {
		
		public function WindowDemo() {
			super();
			stage.showDefaultContextMenu = false;
			stage.scaleMode = "noScale";
			stage.align = "TL";
			
			ThemeBase.initialize(stage);
			ThemeBase.theme = new BlueTheme();
			
			var style:ContainerStyle = new ContainerStyle();
			style.background = new ScaleBitmap(new BitmapData(1, 1, false, 0xCCCCCC));
			
			//var flow:FlowContainer = new FlowContainer(null, FlowContainer.VERTICALLY);
			//flow.style = style;
			
			var flow:ScrollContainer = new ScrollContainer(null, FlowContainer.VERTICALLY);
			flow.lock = true;
			flow.margin.reset(0, 8, 0, 8);
			
			flow.content.addChild(new Label(null, "Label"));
			flow.content.addChild(new Button(null, "Button"));
			flow.content.addChild(new Button(null, "Button"));
			flow.content.addChild(new Button(null, "Button"));
			flow.content.addChild(new Button(null, "Button"));
			flow.content.addChild(new Button(null, "Button"));
			flow.content.addChild(new Button(null, "Button"));
			flow.update();
			
			flow.setScrollBar(true, true);
			flow.setContentSize(200, flow.content.height + 30);
			
			var window:Window = new Window(this, flow);
			window.header.content.addChild(new Label(null, "Window"));
			window.header.update();
			window.liveResize = true;
			window.minWidth = 200;
			window.minHeight = 200;
			window.move(10, 10);
			window.size(200, 200);
		}
		
	}

}