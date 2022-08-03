import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStack extends StatefulWidget {
  const WebViewStack({super.key});

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;
  var _htmlContent = '';
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    parseHtmlContent();
  }

  String getHtml() {
    return '''<div class="fr-view">
<h1>Heading 1</h1>
<p><strong>Left Align</strong> Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis, porttitor et ultrices non, vestibulum vel nisi. Integer nulla quam, semper et felis quis, eleifend tempor augue. Donec aliquam est a vehicula finibus. Sed a eros non eros luctus sagittis malesuada vel lectus. Phasellus laoreet sagittis erat, eu commodo libero consequat ut. Duis vehicula metus ut vulputate mollis. Duis ut augue tincidunt, laoreet nibh et, faucibus nunc.</p>
<p><img src="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/517/58d/09a/panicked_babbling_futurama.gif" alt="Alt Text: Alert Alert" style="width: 296.003px; margin: 5px auto 5px 0px; text-align: left; display: block;" class="fr-fic fr-dii fr-bordered fr-shadow fr-fil" srcset="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/517/58d/09a/panicked_babbling_futurama.gif?width=1920 1x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/517/58d/09a/panicked_babbling_futurama.gif?width=1920&amp;dpr=2 2x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/517/58d/09a/panicked_babbling_futurama.gif?width=1920&amp;dpr=3 3x"></p>
<p style="text-align: right;"><strong>Right Align</strong> Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis, porttitor et ultrices non, vestibulum vel nisi. Integer nulla quam, semper et felis quis, eleifend tempor augue. Donec aliquam est a vehicula finibus. Sed a eros non eros luctus sagittis malesuada vel lectus. Phasellus laoreet sagittis erat, eu commodo libero consequat ut. Duis vehicula metus ut vulputate mollis. Duis ut augue tincidunt, laoreet nibh et, faucibus nunc.</p>
<p style="text-align: justify;"><br></p>
<p style="text-align: justify;"><br></p>
<p style="text-align: justify;"><strong>Justify</strong> Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis, porttitor et ultrices non, vestibulum vel nisi. Integer nulla quam, semper et felis quis, eleifend tempor augue. Donec aliquam est a vehicula finibus. Sed a eros non eros luctus sagittis malesuada vel lectus. Phasellus laoreet sagittis erat, eu commodo libero consequat ut. Duis vehicula metus ut vulputate mollis. Duis ut augue tincidunt, laoreet nibh et, faucibus nunc.</p>
<p style="text-align: justify;"><br></p>
<p style="text-align: justify;"><span class="fr-img-caption fr-fic fr-dib fr-fir" style="width: 300px; display: block; margin: 5px 0px 5px auto; text-align: right;"><span class="fr-img-wrap" style="display: flex; flex-direction: column; width: 300px;"><img src="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/Stabilized-Souffle-Futurama.gif" alt="This is alt text not a caption" style="width: 300px;" srcset="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/Stabilized-Souffle-Futurama.gif?width=1920 1x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/Stabilized-Souffle-Futurama.gif?width=1920&amp;dpr=2 2x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/Stabilized-Souffle-Futurama.gif?width=1920&amp;dpr=3 3x"><span class="fr-inner" style="width: 300px;">This is a caption on a right aligned image<br></span></span> </span></p>
<p style="text-align: center;"><strong>Center</strong> Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis, porttitor et ultrices non, vestibulum vel nisi. Integer nulla quam, semper et felis quis, eleifend tempor augue. Donec aliquam est a vehicula finibus. Sed a eros non eros luctus sagittis malesuada vel lectus. Phasellus laoreet sagittis erat, eu commodo libero consequat ut. Duis vehicula metus ut vulputate mollis. Duis ut augue tincidunt, laoreet nibh et, faucibus nunc.</p>
<p><br></p>
<p><strong>This video is set to auto play:</strong></p>
<p><strong><span class="fr-video fr-fvc fr-draggable fr-dvb fr-active" contenteditable="false" draggable="true"><iframe src="https://platform.thinkific-staging.com/videoproxy/v1/play/c6gjgmh757hhdsc7b5og?autoplay=true" scrolling="no" class="videoproxy_embed" title="Futurama Edit - Recut (What if Fry choose to stay in the past).mp4 - 03:29" name="videoproxy_embed" allowfullscreen=""></iframe></span></strong></p>
<p>Suspendisse egestas, tellus vitae porta tempus, tortor dolor convallis ligula, vitae interdum magna tortor ut ex. Donec id enim blandit, molestie nunc sit amet, pulvinar risus. Suspendisse quis nisl fermentum, accumsan nisi eget, sollicitudin diam. Sed nulla sem, faucibus ac eros at, laoreet tincidunt libero. Morbi a lorem in mi aliquam vehicula vitae eget purus. Etiam ut sapien egestas, rutrum est vel, placerat lorem. Integer eget quam ac orci iaculis facilisis sed at justo. Quisque sodales nunc lorem, vitae vehicula diam dapibus ac. Ut bibendum libero eu ante blandit, eu pretium risus ultricies. Vivamus faucibus tortor faucibus massa faucibus, ut lobortis elit fermentum. Donec eu magna pharetra, sollicitudin mauris et, posuere ex.</p>
<p><br></p>
<p style="text-align: justify;"><span class="fr-img-caption fr-fic fr-dib fr-fir" style="width: 300px; display: block; margin: 5px 0px 5px auto; text-align: right;"><span class="fr-img-wrap" style="display: flex; flex-direction: column; width: 300px;"><img src="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/404.gif" alt="This is alt text not a caption, this image is expected to fail" style="width: 300px;" srcset="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/404.gif?width=1920 1x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/404.gif?width=1920&amp;dpr=2 2x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/404.gif?width=1920&amp;dpr=3 3x"><span class="fr-inner" style="width: 300px;">This is a caption on a right aligned image<br></span></span> </span></p>
<p><br></p>
<p>Horizontal rule</p>
<hr>
<p>Horizontal rule</p>
<p><br></p>
<blockquote>
<p> Blockquote did not behave well in the editor, had to do this manually</p>
<p> The purpose of bureaucracy is to compensate for incompetence and lack of discipline.</p>
</blockquote>
<p><br></p>
<p>This is a link to <a class="fr-strong fr-green" href="https://www.google.com">Google</a> dot com (not a new tab)</p>
<p>This is a link to <a class="fr-strong fr-green" href="https://www.google.com" rel="noopener noreferrer" target="_blank">Google</a> dot com (yes, new tab)</p>
<p>This is a <a href="https://futurama.thinkific-staging.com/courses/take/web-development-course/texts/153027-hello-world-1">link to lesson one</a> in the hidden web dev course</p>
<p><br></p>
<p>This is an audio file</p>
<p><span class="fr-audio" contenteditable="false" style="display: block; text-align: center;"><audio controls="" src="https://files.cdn.thinkific-staging.com/file_uploads/7913/attachments/cef/482/cc3/file_example_MP3_1MG.mp3">If you are reading this, it is because your browser does not support the audio element.</audio></span></p>
<p><br></p>
<p>This is a 5x5 table, dashed borders alternating rows</p>
<table class="fr-alternate-rows fr-dashed-borders" style="width: 100%;">
<thead><tr>
<th>Header Column 1<br>
</th>
<th>Header Column 2<br>
</th>
<th>Header Column 3<br>
</th>
<th>Header Column 4<br>
</th>
<th>Header Column 5<br>
</th>
</tr></thead>
<tbody>
<tr>
<td style="width: 20%; background-color: rgb(184, 49, 47);"><br></td>
<td style="width: 20%; background-color: rgb(251, 160, 38);"><br></td>
<td style="width: 20%; background-color: rgb(247, 218, 100);"><br></td>
<td style="width: 20%; background-color: rgb(65, 168, 95);"><br></td>
<td style="width: 20%; background-color: rgb(44, 130, 201);"><br></td>
</tr>
<tr>
<td style="width: 20.0000%;"><br></td>
<td style="width: 20.0000%;"><br></td>
<td style="width: 20.0000%;"><br></td>
<td style="width: 20.0000%;"><br></td>
<td style="width: 20.0000%;"><br></td>
</tr>
<tr>
<td style="width: 20.0000%;">Line 1<br>Line 2<br>Line 3<br>
</td>
<td colspan="3" style="width: 59.8592%; text-align: center; vertical-align: middle;">These three cells are merged and the text is centered<br>
</td>
<td style="width: 20%; text-align: right;">Line 1<br>Line 2<br>Line 3<br>
</td>
</tr>
<tr>
<td style="width: 20.0000%;"><br></td>
<td style="width: 20.0000%;"><br></td>
<td style="width: 20.0000%;"><br></td>
<td style="width: 20.0000%;"><br></td>
<td style="width: 20.0000%;"><br></td>
</tr>
<tr>
<td style="width: 20%; text-align: left; vertical-align: top;">There's an image in the far right column<br>
</td>
<td style="width: 20.0000%;"><br></td>
<td style="width: 20.0000%;"><br></td>
<td style="width: 20.0000%;"><br></td>
<td style="width: 20.0000%;">
<img src="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/4ad/641/4cf/Scruffy_2_9337.jpg" style="width: 300px;" class="fr-fic fr-dib" srcset="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/4ad/641/4cf/Scruffy_2_9337.jpg?width=1920 1x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/4ad/641/4cf/Scruffy_2_9337.jpg?width=1920&amp;dpr=2 2x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/4ad/641/4cf/Scruffy_2_9337.jpg?width=1920&amp;dpr=3 3x"><br>
</td>
</tr>
</tbody>
</table>
<p><br></p>
<p>This is a larger 10x10 table, dashed borders alternating rows, sometimes the bane of responsive websites</p>
<table class="fr-alternate-rows" style="width: 100%;">
<thead><tr>
<th>Header</th>
<th><br></th>
<th style="width: 10.3057%;"><br></th>
<th style="width: 10.3059%;"><br></th>
<th><br></th>
<th><br></th>
<th style="width: 10.3058%;"><br></th>
<th style="width: 10.3058%;"><br></th>
<th style="width: 10.6805%;"><br></th>
<th><br></th>
</tr></thead>
<tbody>
<tr>
<td style="width: 10.0000%;">1<br>
</td>
<td style="width: 10.0000%;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td style="width: 10.3057%;"><br></td>
<td style="width: 10.3059%;"><br></td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.6805%;"><br></td>
<td style="width: 10.0000%;"><br></td>
</tr>
<tr>
<td style="width: 10.0000%;">2<br>
</td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3057%;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td style="width: 10.3059%;"><br></td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.6805%;"><br></td>
<td style="width: 10.0000%;"><br></td>
</tr>
<tr>
<td style="width: 10.0000%;">3<br>
</td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3057%;"><br></td>
<td style="width: 10.3059%;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.6805%;"><br></td>
<td style="width: 10.0000%;"><br></td>
</tr>
<tr>
<td style="width: 10.0000%;">4<br>
</td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3057%;"><br></td>
<td style="width: 10.3059%;"><br></td>
<td style="width: 10.0000%;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.6805%;"><br></td>
<td style="width: 10.0000%;">\</td>
</tr>
<tr>
<td style="width: 10.0000%;">5<br>
</td>
<td style="width: 10.0000%;">Sed ut blandit urna, imperdiet facilisis tellus.<br><img src="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/459/4b1/4f1/lazy_busy_couch.jpg" style="width: 300px;" class="fr-fic fr-dib" srcset="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/459/4b1/4f1/lazy_busy_couch.jpg?width=1920 1x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/459/4b1/4f1/lazy_busy_couch.jpg?width=1920&amp;dpr=2 2x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/459/4b1/4f1/lazy_busy_couch.jpg?width=1920&amp;dpr=3 3x">Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td style="width: 10.3057%;">Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td style="width: 10.3059%;">Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td style="width: 10.0000%;">Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td style="width: 10.0000%;">Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td style="width: 10.3058%;">Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td style="width: 10.3058%;">Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td style="width: 10.6805%;">Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td style="width: 10.0000%;">Sed ut blandit urna, imperdiet facilisis tellus.<br><br><img src="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/b0b/8e3/5cf/tube_commute.gif" style="width: 300px;" class="fr-fic fr-dib" srcset="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/b0b/8e3/5cf/tube_commute.gif?width=1920 1x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/b0b/8e3/5cf/tube_commute.gif?width=1920&amp;dpr=2 2x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/b0b/8e3/5cf/tube_commute.gif?width=1920&amp;dpr=3 3x">Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis</td>
</tr>
<tr>
<td style="width: 10.0000%;">6<br>
</td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3057%;"><br></td>
<td style="width: 10.3059%;"><br></td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.0000%;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.6805%;"><br></td>
<td style="width: 10.0000%;"><br></td>
</tr>
<tr>
<td style="width: 10.0000%;">7<br>
</td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3057%;"><br></td>
<td style="width: 10.3059%;"><br></td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3058%;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.6805%;"><br></td>
<td style="width: 10.0000%;"><br></td>
</tr>
<tr>
<td style="width: 10.0000%;">8<br>
</td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3057%;"><br></td>
<td style="width: 10.3059%;"><br></td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.3058%;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td style="width: 10.6805%;"><br></td>
<td style="width: 10.0000%;"><br></td>
</tr>
<tr>
<td style="width: 10.0000%;">9<br>
</td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3057%;"><br></td>
<td style="width: 10.3059%;"><br></td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.6805%;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td style="width: 10.0000%;"><br></td>
</tr>
<tr>
<td style="width: 10.0000%;">10<br>
</td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3057%;"><br></td>
<td style="width: 10.3059%;"><br></td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.0000%;"><br></td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.3058%;"><br></td>
<td style="width: 10.6805%;"><br></td>
<td style="width: 10.0000%;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
</tr>
</tbody>
</table>
<p><br></p>
<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>
<h4>Heading 4</h4>
<pre>Code block start
Short line
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique. Interdum et malesuada fames ac ante ipsum primis in faucibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean in neque eget nunc vestibulum gravida. Pellentesque euismod risus ut quam consectetur
Short line
Code block end</pre>
<p><span style="font-size: 8px;">Font size 8px</span></p>
<p><span style="font-size: 10px;">Font size 10px</span></p>
<p><span style="font-size: 12px;">Font size 12px</span></p>
<p><span style="font-size: 16px;">Font size 16px</span></p>
<p><span style="font-size: 18px;">Font size 18px</span></p>
<p><span style="font-size: 20px;">Font size 20px</span></p>
<p><span style="font-size: 24px;">Font size 24px</span></p>
<p><span style="font-size: 30px;">Font size 30px</span></p>
<p><span style="font-size: 60px;">Font size 60px</span></p>
<p><span style="font-size: 96px;">Font size 96px</span></p>
<p><br></p>
<ol>
<li><span style="font-family: Arial,Helvetica,sans-serif;">This is Arial</span></li>
<li><span style="font-family: Georgia,serif;">This is Georgia</span></li>
<li><span style="font-family: Impact,Charcoal,sans-serif;">This is Impact</span></li>
<li><span style="font-family: Tahoma,Geneva,sans-serif;">This is Tahoma</span></li>
<li><span style="font-family: Times New Roman,Times,serif,-webkit-standard;">This is New Times Roman</span></li>
<li><span style="font-family: Verdana,Geneva,sans-serif;">This is Verdana</span></li>
</ol>
<ul>
<li>
<span style="color: rgb(184, 49, 47);">Red</span> </li>
<li>
<span style="color: rgb(243, 121, 52);">Orange</span> </li>
<li>
<span style="color: rgb(250, 197, 28);">Yellow</span> </li>
<li>
<span style="color: rgb(65, 168, 95);">Green</span> </li>
<li>
<span style="color: rgb(44, 130, 201);">Blue</span> </li>
<li>
<span style="color: rgb(147, 101, 184);">Indigo</span> </li>
<li><span style="color: rgb(85, 57, 130);">Violet</span></li>
</ul>
<p style="margin-left: 60px;"><strong>Three indents then Bold</strong> </p>
<p style="margin-left: 100px;"><em>Five indents then I</em><em>talics</em> </p>
<p style="margin-left: 140px;"><u>Seven indents then Underline</u></p>
<p>Default normal text : &lt;p&gt; tag Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique. Interdum et malesuada fames ac ante ipsum primis in faucibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean in neque eget nunc vestibulum gravida. Pellentesque euismod risus ut quam consectetur, sodales posuere ligula tincidunt. Etiam ut elit et ligula euismod scelerisque eget ut erat. Sed faucibus sem at semper vestibulum. Aliquam vel sem sed sapien ultrices tristique at a erat. Vestibulum ultrices nec nibh id condimentum. Suspendisse porttitor, mauris id condimentum ultricies, eros tellus lobortis magna, quis pellentesque metus ex non augue. Proin placerat cursus neque, in auctor nisi viverra ac. Ut lacinia, velit ac consequat congue, risus magna pulvinar turpis, eu hendrerit elit purus nec neque. Morbi non finibus lectus, sed ornare sem. Nunc dictum lorem consectetur turpis pharetra, ut luctus odio convallis.</p>
<p>Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis, porttitor et ultrices non, vestibulum vel nisi. Integer nulla quam, semper et felis quis, eleifend tempor augue. Donec aliquam est a vehicula finibus. Sed a eros non eros luctus sagittis malesuada vel lectus. Phasellus laoreet sagittis erat, eu commodo libero consequat ut. Duis vehicula metus ut vulputate mollis. Duis ut augue tincidunt, laoreet nibh et, faucibus nunc.</p>
<p>Suspendisse egestas, tellus vitae porta tempus, tortor dolor convallis ligula, vitae interdum magna tortor ut ex. Donec id enim blandit, molestie nunc sit amet, pulvinar risus. Suspendisse quis nisl fermentum, accumsan nisi eget, sollicitudin diam. Sed nulla sem, faucibus ac eros at, laoreet tincidunt libero. Morbi a lorem in mi aliquam vehicula vitae eget purus. Etiam ut sapien egestas, rutrum est vel, placerat lorem. Integer eget quam ac orci iaculis facilisis sed at justo. Quisque sodales nunc lorem, vitae vehicula diam dapibus ac. Ut bibendum libero eu ante blandit, eu pretium risus ultricies. Vivamus faucibus tortor faucibus massa faucibus, ut lobortis elit fermentum. Donec eu magna pharetra, sollicitudin mauris et, posuere ex.</p>
<p>Integer pulvinar mi at rhoncus placerat. Maecenas eu est non arcu cursus dapibus. Praesent felis nisi, lacinia a convallis a, porta in nulla. Nunc nec pharetra quam. Vestibulum cursus sagittis massa, quis pharetra magna malesuada ut. Vestibulum justo tortor, eleifend eu aliquam quis, blandit vitae erat. Maecenas ut venenatis justo, vitae laoreet tortor. Mauris sed fermentum risus, placerat imperdiet nisl. Proin accumsan ipsum id tellus aliquam consectetur. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer ut pretium quam. Suspendisse ornare eleifend elit, eget vulputate eros sollicitudin vitae. Nam facilisis at neque sed molestie. Ut ac auctor massa.</p>
<p>Sed ut risus eu est porta convallis. In varius lectus ac nulla elementum dignissim. Etiam id nulla condimentum, scelerisque tortor sed, efficitur nisi. Quisque sit amet lacus augue. Nullam sem dolor, hendrerit eget mi sed, pretium porta tortor. Mauris semper pharetra auctor. Proin elementum justo lacinia placerat pretium. Duis lacinia mauris elit, sit amet dictum dolor ullamcorper quis. Fusce sit amet congue tellus. Mauris ultrices ex a diam efficitur, et pellentesque dolor vulputate. Mauris posuere ut elit vitae ornare. Sed congue faucibus nisi, vitae laoreet massa lobortis non. Sed sagittis aliquam pellentesque.</p>
<p><strong>This is the end. Using this to test how the completion widget interacts with the text </strong></p>
<p><br></p>
<p><br></p>
<p>--- AGAIN ---</p>
<p><br></p>
<h1>Heading 1</h1>
<p><strong>Left Align</strong> Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis, porttitor et ultrices non, vestibulum vel nisi. Integer nulla quam, semper et felis quis, eleifend tempor augue. Donec aliquam est a vehicula finibus. Sed a eros non eros luctus sagittis malesuada vel lectus. Phasellus laoreet sagittis erat, eu commodo libero consequat ut. Duis vehicula metus ut vulputate mollis. Duis ut augue tincidunt, laoreet nibh et, faucibus nunc.</p>
<p><img data-fr-image-pasted="true" src="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/517/58d/09a/panicked_babbling_futurama.gif" alt="Alt Text: Alert Alert" srcset="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/517/58d/09a/panicked_babbling_futurama.gif?width=1920 1x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/517/58d/09a/panicked_babbling_futurama.gif?width=1920&amp;dpr=2 2x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/517/58d/09a/panicked_babbling_futurama.gif?width=1920&amp;dpr=3 3x" class="fr-fic fr-dii"></p>
<p><strong>Right Align</strong> Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis, porttitor et ultrices non, vestibulum vel nisi. Integer nulla quam, semper et felis quis, eleifend tempor augue. Donec aliquam est a vehicula finibus. Sed a eros non eros luctus sagittis malesuada vel lectus. Phasellus laoreet sagittis erat, eu commodo libero consequat ut. Duis vehicula metus ut vulputate mollis. Duis ut augue tincidunt, laoreet nibh et, faucibus nunc.</p>
<p><br></p>
<p><br></p>
<p><strong>Justify</strong> Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis, porttitor et ultrices non, vestibulum vel nisi. Integer nulla quam, semper et felis quis, eleifend tempor augue. Donec aliquam est a vehicula finibus. Sed a eros non eros luctus sagittis malesuada vel lectus. Phasellus laoreet sagittis erat, eu commodo libero consequat ut. Duis vehicula metus ut vulputate mollis. Duis ut augue tincidunt, laoreet nibh et, faucibus nunc.</p>
<p><br></p>
<p><span contenteditable="false" draggable="false"><img data-fr-image-pasted="true" src="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/Stabilized-Souffle-Futurama.gif" alt="This is alt text not a caption" srcset="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/Stabilized-Souffle-Futurama.gif?width=1920 1x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/Stabilized-Souffle-Futurama.gif?width=1920&amp;dpr=2 2x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/Stabilized-Souffle-Futurama.gif?width=1920&amp;dpr=3 3x" class="fr-fic fr-dii"><span contenteditable="true">This is a caption on a right aligned image<br></span> </span></p>
<p><strong>Center</strong> Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis, porttitor et ultrices non, vestibulum vel nisi. Integer nulla quam, semper et felis quis, eleifend tempor augue. Donec aliquam est a vehicula finibus. Sed a eros non eros luctus sagittis malesuada vel lectus. Phasellus laoreet sagittis erat, eu commodo libero consequat ut. Duis vehicula metus ut vulputate mollis. Duis ut augue tincidunt, laoreet nibh et, faucibus nunc.</p>
<p><br></p>
<p><strong>This video is set to auto play:</strong></p>
<p><strong><span contenteditable="false" draggable="true"><iframe src="https://platform.thinkific-staging.com/videoproxy/v1/play/c6gjgmh757hhdsc7b5og?autoplay=true" scrolling="no" title="Futurama Edit - Recut (What if Fry choose to stay in the past).mp4 - 03:29" name="videoproxy_embed" allowfullscreen=""></iframe></span></strong></p>
<p>Suspendisse egestas, tellus vitae porta tempus, tortor dolor convallis ligula, vitae interdum magna tortor ut ex. Donec id enim blandit, molestie nunc sit amet, pulvinar risus. Suspendisse quis nisl fermentum, accumsan nisi eget, sollicitudin diam. Sed nulla sem, faucibus ac eros at, laoreet tincidunt libero. Morbi a lorem in mi aliquam vehicula vitae eget purus. Etiam ut sapien egestas, rutrum est vel, placerat lorem. Integer eget quam ac orci iaculis facilisis sed at justo. Quisque sodales nunc lorem, vitae vehicula diam dapibus ac. Ut bibendum libero eu ante blandit, eu pretium risus ultricies. Vivamus faucibus tortor faucibus massa faucibus, ut lobortis elit fermentum. Donec eu magna pharetra, sollicitudin mauris et, posuere ex.</p>
<p><br></p>
<p><span contenteditable="false" draggable="false"><img data-fr-image-pasted="true" src="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/404.gif" alt="This is alt text not a caption, this image is expected to fail" srcset="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/404.gif?width=1920 1x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/404.gif?width=1920&amp;dpr=2 2x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/cf7/dbb/dde/404.gif?width=1920&amp;dpr=3 3x" class="fr-fic fr-dii"><span contenteditable="true">This is a caption on a right aligned image<br></span> </span></p>
<p><br></p>
<p>Horizontal rule</p>
<hr>
<p>Horizontal rule</p>
<p><br></p>
<blockquote>
<p> Blockquote did not behave well in the editor, had to do this manually</p>
<p> The purpose of bureaucracy is to compensate for incompetence and lack of discipline.</p>
</blockquote>
<p><br></p>
<p>This is a link to <a href="https://www.google.com/">Google</a> dot com (not a new tab)</p>
<p>This is a link to <a href="https://www.google.com/" rel="noopener noreferrer" target="_blank">Google</a> dot com (yes, new tab)</p>
<p>This is a <a href="https://futurama.thinkific-staging.com/courses/take/web-development-course/texts/153027-hello-world-1">link to lesson one</a> in the hidden web dev course</p>
<p><br></p>
<p>This is an audio file</p>
<p><br></p>
<p>This is a 5x5 table, dashed borders alternating rows</p>
<table>
<thead><tr>
<th>Header Column 1<br>
</th>
<th>Header Column 2<br>
</th>
<th>Header Column 3<br>
</th>
<th>Header Column 4<br>
</th>
<th>Header Column 5<br>
</th>
</tr></thead>
<tbody>
<tr>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
</tr>
<tr>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
</tr>
<tr>
<td>Line 1<br>Line 2<br>Line 3<br>
</td>
<td colspan="3">These three cells are merged and the text is centered<br>
</td>
<td>Line 1<br>Line 2<br>Line 3<br>
</td>
</tr>
<tr>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
</tr>
<tr>
<td>There's an image in the far right column<br>
</td>
<td><br></td>
<td><br></td>
<td><br></td>
<td>
<img data-fr-image-pasted="true" src="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/4ad/641/4cf/Scruffy_2_9337.jpg" srcset="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/4ad/641/4cf/Scruffy_2_9337.jpg?width=1920 1x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/4ad/641/4cf/Scruffy_2_9337.jpg?width=1920&amp;dpr=2 2x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/4ad/641/4cf/Scruffy_2_9337.jpg?width=1920&amp;dpr=3 3x" class="fr-fic fr-dii"><br>
</td>
</tr>
</tbody>
</table>
<p><br></p>
<p>This is a larger 10x10 table, dashed borders alternating rows, sometimes the bane of responsive websites</p>
<table>
<thead><tr>
<th>Header</th>
<th><br></th>
<th><br></th>
<th><br></th>
<th><br></th>
<th><br></th>
<th><br></th>
<th><br></th>
<th><br></th>
<th><br></th>
</tr></thead>
<tbody>
<tr>
<td>1<br>
</td>
<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
</tr>
<tr>
<td>2<br>
</td>
<td><br></td>
<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
</tr>
<tr>
<td>3<br>
</td>
<td><br></td>
<td><br></td>
<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
</tr>
<tr>
<td>4<br>
</td>
<td><br></td>
<td><br></td>
<td><br></td>
<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td>\</td>
</tr>
<tr>
<td>5<br>
</td>
<td>Sed ut blandit urna, imperdiet facilisis tellus.<br><img data-fr-image-pasted="true" src="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/459/4b1/4f1/lazy_busy_couch.jpg" srcset="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/459/4b1/4f1/lazy_busy_couch.jpg?width=1920 1x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/459/4b1/4f1/lazy_busy_couch.jpg?width=1920&amp;dpr=2 2x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/459/4b1/4f1/lazy_busy_couch.jpg?width=1920&amp;dpr=3 3x" class="fr-fic fr-dii">Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td>Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td>Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td>Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td>Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td>Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td>Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td>Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis<br>
</td>
<td>Sed ut blandit urna, imperdiet facilisis tellus.<br><br><img data-fr-image-pasted="true" src="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/b0b/8e3/5cf/tube_commute.gif" srcset="https://files.cdn.thinkific-staging.com/file_uploads/7913/images/b0b/8e3/5cf/tube_commute.gif?width=1920 1x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/b0b/8e3/5cf/tube_commute.gif?width=1920&amp;dpr=2 2x, https://files.cdn.thinkific-staging.com/file_uploads/7913/images/b0b/8e3/5cf/tube_commute.gif?width=1920&amp;dpr=3 3x" class="fr-fic fr-dii">Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis</td>
</tr>
<tr>
<td>6<br>
</td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
</tr>
<tr>
<td>7<br>
</td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td><br></td>
<td><br></td>
<td><br></td>
</tr>
<tr>
<td>8<br>
</td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td><br></td>
<td><br></td>
</tr>
<tr>
<td>9<br>
</td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
<td><br></td>
</tr>
<tr>
<td>10<br>
</td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td><br></td>
<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique.<br>
</td>
</tr>
</tbody>
</table>
<p><br></p>
<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>
<h4>Heading 4</h4>
<pre>Code block start
Short line
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique. Interdum et malesuada fames ac ante ipsum primis in faucibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean in neque eget nunc vestibulum gravida. Pellentesque euismod risus ut quam consectetur
Short line
Code block end</pre>
<p>Font size 8px</p>
<p>Font size 10px</p>
<p>Font size 12px</p>
<p>Font size 16px</p>
<p>Font size 18px</p>
<p>Font size 20px</p>
<p>Font size 24px</p>
<p>Font size 30px</p>
<p>Font size 60px</p>
<p>Font size 96px</p>
<p><br></p>
<ol>
<li>This is Arial</li>
<li>This is Georgia</li>
<li>This is Impact</li>
<li>This is Tahoma</li>
<li>This is New Times Roman</li>
<li>This is Verdana</li>
</ol>
<ul>
<li>Red </li>
<li>Orange </li>
<li>Yellow </li>
<li>Green </li>
<li>Blue </li>
<li>Indigo </li>
<li>Violet</li>
</ul>
<p><strong>Three indents then Bold</strong> </p>
<p><em>Five indents then I</em><em>talics</em> </p>
<p><u>Seven indents then Underline</u></p>
<p>Default normal text : &lt;p&gt; tag Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor orci a libero iaculis, ac rutrum erat tristique. Interdum et malesuada fames ac ante ipsum primis in faucibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean in neque eget nunc vestibulum gravida. Pellentesque euismod risus ut quam consectetur, sodales posuere ligula tincidunt. Etiam ut elit et ligula euismod scelerisque eget ut erat. Sed faucibus sem at semper vestibulum. Aliquam vel sem sed sapien ultrices tristique at a erat. Vestibulum ultrices nec nibh id condimentum. Suspendisse porttitor, mauris id condimentum ultricies, eros tellus lobortis magna, quis pellentesque metus ex non augue. Proin placerat cursus neque, in auctor nisi viverra ac. Ut lacinia, velit ac consequat congue, risus magna pulvinar turpis, eu hendrerit elit purus nec neque. Morbi non finibus lectus, sed ornare sem. Nunc dictum lorem consectetur turpis pharetra, ut luctus odio convallis.</p>
<p>Sed ut blandit urna, imperdiet facilisis tellus. Sed quis pretium ex. Proin posuere pharetra purus eu scelerisque. In elit felis, porttitor et ultrices non, vestibulum vel nisi. Integer nulla quam, semper et felis quis, eleifend tempor augue. Donec aliquam est a vehicula finibus. Sed a eros non eros luctus sagittis malesuada vel lectus. Phasellus laoreet sagittis erat, eu commodo libero consequat ut. Duis vehicula metus ut vulputate mollis. Duis ut augue tincidunt, laoreet nibh et, faucibus nunc.</p>
<p>Suspendisse egestas, tellus vitae porta tempus, tortor dolor convallis ligula, vitae interdum magna tortor ut ex. Donec id enim blandit, molestie nunc sit amet, pulvinar risus. Suspendisse quis nisl fermentum, accumsan nisi eget, sollicitudin diam. Sed nulla sem, faucibus ac eros at, laoreet tincidunt libero. Morbi a lorem in mi aliquam vehicula vitae eget purus. Etiam ut sapien egestas, rutrum est vel, placerat lorem. Integer eget quam ac orci iaculis facilisis sed at justo. Quisque sodales nunc lorem, vitae vehicula diam dapibus ac. Ut bibendum libero eu ante blandit, eu pretium risus ultricies. Vivamus faucibus tortor faucibus massa faucibus, ut lobortis elit fermentum. Donec eu magna pharetra, sollicitudin mauris et, posuere ex.</p>
<p>Integer pulvinar mi at rhoncus placerat. Maecenas eu est non arcu cursus dapibus. Praesent felis nisi, lacinia a convallis a, porta in nulla. Nunc nec pharetra quam. Vestibulum cursus sagittis massa, quis pharetra magna malesuada ut. Vestibulum justo tortor, eleifend eu aliquam quis, blandit vitae erat. Maecenas ut venenatis justo, vitae laoreet tortor. Mauris sed fermentum risus, placerat imperdiet nisl. Proin accumsan ipsum id tellus aliquam consectetur. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer ut pretium quam. Suspendisse ornare eleifend elit, eget vulputate eros sollicitudin vitae. Nam facilisis at neque sed molestie. Ut ac auctor massa.</p>
<p>Sed ut risus eu est porta convallis. In varius lectus ac nulla elementum dignissim. Etiam id nulla condimentum, scelerisque tortor sed, efficitur nisi. Quisque sit amet lacus augue. Nullam sem dolor, hendrerit eget mi sed, pretium porta tortor. Mauris semper pharetra auctor. Proin elementum justo lacinia placerat pretium. Duis lacinia mauris elit, sit amet dictum dolor ullamcorper quis. Fusce sit amet congue tellus. Mauris ultrices ex a diam efficitur, et pellentesque dolor vulputate. Mauris posuere ut elit vitae ornare. Sed congue faucibus nisi, vitae laoreet massa lobortis non. Sed sagittis aliquam pellentesque.</p>
<p><strong>This is the end. Using this to test how the completion widget interacts with the text </strong></p>
<p><br></p>
<p><br></p>
</div>''';
  }

  /// To use the browser load event and getting the correct height value
  /// we should load the whole content, including css and javascript.
  /// As the initialUrl does not load the related files inside the HTML,
  /// we are now injecting the files in the html content.
  Future<void> parseHtmlContent() async {
    final content =
        await rootBundle.loadString('lib/ui/assets/base_web_content.html');
    final cssContent = await rootBundle.loadString('lib/ui/assets/css/app.css');
    final jsContent = await rootBundle.loadString('lib/ui/assets/js/app.js');

    final uri = Uri.dataFromString(
      content
          .replaceAll('{{content}}', getHtml())
          .replaceAll('{{styles}}', cssContent)
          .replaceAll('{{scriptFile}}', jsContent),
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    );

    _controller.loadUrl(uri.toString());

    // setState(() {
    //   _htmlContent = Uri.dataFromString('<html><body>hello world</body></html>',
    //           mimeType: 'text/html')
    //       .toString(); // uri.toString();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            height: 10000,
            child: WebView(
              initialUrl: _htmlContent,
              backgroundColor: Colors.amber,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                _controller = controller;
                parseHtmlContent();
              },
              onPageStarted: (url) {
                setState(() {
                  loadingPercentage = 0;
                });
              },
              onProgress: (progress) {
                setState(() {
                  loadingPercentage = progress;
                });
              },
              onPageFinished: (url) async {
                print('FINISHED: $url');
                // final result =
                //     await _controller.runJavascriptReturningResult('configure()');
                // final int? height = int.tryParse(result);
                // if (height != null) {
                //   // await _onPageReady(height.toDouble());
                //   final newheight = height.toDouble();
                // }
                setState(() {
                  loadingPercentage = 100;
                });
              },
            ),
          ),
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            color: Colors.amber,
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
