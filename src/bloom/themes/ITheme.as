package bloom.themes 
{
	import flash.display.BitmapData;
	
	import bloom.styles.*;
	
	/**
	 * ITheme
	 */
	public interface ITheme {
		
		function get alpha():Number;
		
		function get plate():BitmapData;
		
		function get buttonBase():ButtonBaseStyle;
		
		function get button():ButtonStyle;
		
		function get label():TextStyle;
		
		function get checkBox():CheckBoxStyle;
		
		function get textInput():TextInputStyle;
		
		function get numericStepper():NumericStepperStyle;
		
		function get progressBar():ProgressBarStyle;
		
		function get slider():SliderStyle;
		
		function get textBox():TextBoxStyle;
		
		function get toggleButton():ToggleButtonStyle;
		
		function get container():ContainerStyle;
		
		function get scrollContainer():ScrollContainerStyle;
		
		function get window():WindowStyle;
		
		function get tabBox():TabBoxStyle;
		
		function get accordion():AccordionStyle;
		
		function get list():ListStyle;
		
		function get tree():TreeStyle;
	}
	
}