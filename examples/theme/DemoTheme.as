package theme 
{
	import bloom.themes.Theme;
	
	import theme.demo.*;
	
	public class DemoTheme extends Theme {
		
		[Embed(source="demo/assets/plate.png")]
		private static var bm0:Class;
		
		public function DemoTheme() {
			_alpha = 0.5;
			_plate = new bm0().bitmapData;
			
			_label = new DemoLabel();
			_button = new DemoButton();
			_buttonBase = new DemoButtonBase();
			_checkBox = new DemoCheckBox();
			_textInput = new DemoTextInput();
			_numericStepper = new DemoNumericStepper();
			_progressBar = new DemoProgressBar();
			_slider = new DemoSlider();
			_textBox = new DemoTextBox();
			_toggleButton = new DemoToggleButton();
			_container = new DemoContainer();
			_scrollContainer = new DemoScrollContainer();
			_window = new DemoWindow();
			_tabBox = new DemoTabBox();
			_accordion = new DemoAccordion();
		}
		
	}

}