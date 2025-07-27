/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	var url = window.location.origin + "/admin";
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.height = 400;  
	config.filebrowserBrowseUrl = url+'/assets/plugins/kcfinder/browse.php?type=files';
	config.filebrowserImageBrowseUrl = url+'/assets/plugins/kcfinder/browse.php?type=images';
	config.filebrowserFlashBrowseUrl = url+'/assets/plugins/kcfinder/browse.php?type=flash';
	config.filebrowserUploadUrl = null;
	config.filebrowserImageUploadUrl = null;
	config.filebrowserFlashUploadUrl = null;
};
