<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<!-- video css -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700,300' rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="<%=request.getContextPath()%>/main/css/style.css">
<!-- content css -->
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/css/demo.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/css/component.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/main/css/content.css" />
<title>MOVIE GO MAIN</title>
</head>
<body>
	<div class="wrapper">
		<div class="screen" id="screen-3" data-video="vid/camera.mp4">
			<img src="<%=request.getContextPath()%>/img/camera.jpg"
				class="big-image" />
			<h1 class="video-title">MOVIE GO</h1>
		</div>
	</div>

	<header>
	<div class="mockup-content">
		<div
			class="morph-button morph-button-modal morph-button-modal-2 morph-button-fixed">
			<button type="button">Login</button>
			<div class="morph-content">
				<div>
					<div class="content-style-form content-style-form-1">
						<span class="icon icon-close">Close the dialog</span>
						<h2>Login</h2>
						<form>
							<p>
								<label>Email</label><input type="text" />
							</p>
							<p>
								<label>Password</label><input type="password" />
							</p>
							<p>
								<button>Login</button>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- morph-button -->
		<strong class="joiner">or</strong>
		<div
			class="morph-button morph-button-modal morph-button-modal-3 morph-button-fixed">
			<button type="button">Signup</button>
			<div class="morph-content">
				<div>
					<div class="content-style-form content-style-form-2">
						<span class="icon icon-close">Close the dialog</span>
						<h2>Sign Up</h2>
						<form>
							<p>
								<label>Email</label><input type="text" />
							</p>
							<p>
								<label>Password</label><input type="password" />
							</p>
							<p>
								<label>Repeat Password</label><input type="password" />
							</p>
							<p>
								<button>Sign Up</button>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- morph-button -->
	</div>
	<!-- /form-mockup --> </header>
	<script src="<%=request.getContextPath()%>/main/js/classie.js"></script>
		<script src="<%=request.getContextPath()%>/main/js/uiMorphingButton_fixed.js"></script>
		<script>
			(function() {
				var docElem = window.document.documentElement, didScroll, scrollPosition;

				// trick to prevent scrolling when opening/closing button
				function noScrollFn() {
					window.scrollTo( scrollPosition ? scrollPosition.x : 0, scrollPosition ? scrollPosition.y : 0 );
				}

				function noScroll() {
					window.removeEventListener( 'scroll', scrollHandler );
					window.addEventListener( 'scroll', noScrollFn );
				}

				function scrollFn() {
					window.addEventListener( 'scroll', scrollHandler );
				}

				function canScroll() {
					window.removeEventListener( 'scroll', noScrollFn );
					scrollFn();
				}

				function scrollHandler() {
					if( !didScroll ) {
						didScroll = true;
						setTimeout( function() { scrollPage(); }, 60 );
					}
				};

				function scrollPage() {
					scrollPosition = { x : window.pageXOffset || docElem.scrollLeft, y : window.pageYOffset || docElem.scrollTop };
					didScroll = false;
				};

				scrollFn();

				[].slice.call( document.querySelectorAll( '.morph-button' ) ).forEach( function( bttn ) {
					new UIMorphingButton( bttn, {
						closeEl : '.icon-close',
						onBeforeOpen : function() {
							// don't allow to scroll
							noScroll();
						},
						onAfterOpen : function() {
							// can scroll again
							canScroll();
						},
						onBeforeClose : function() {
							// don't allow to scroll
							noScroll();
						},
						onAfterClose : function() {
							// can scroll again
							canScroll();
						}
					} );
				} );

				// for demo purposes only
				[].slice.call( document.querySelectorAll( 'form button' ) ).forEach( function( bttn ) { 
					bttn.addEventListener( 'click', function( ev ) { ev.preventDefault(); } );
				} );
			})();
		</script>

</body>
</html>