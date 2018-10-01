	//For Comments
	$(document).on('submit', '.comment-form', function(e) {
		e.preventDefault();
		e.stopPropagation();
		var $form = $(this);
		var url = window.location.href;
		$.post(url, $form.serialize())
			.done(function(data) {
				addComment(data);
				$form[0].reset();
				$(".mention_suggestions").empty();
			});
	});


	function addComment(data){
		var csrf = $("input[name='csrfmiddlewaretoken']").first().val();
		/*var new_comment = '<li class="list-group-item " id="comment-'+ data.id + '"style="background-color: #f7f7f7;text-align:left"><h6>' + data.text + '</h6><p> <span class="blog-date"><strong style="color:#000;font-size:20px;"> By:' + data.author + '</strong>   ' + data.date + '</span></p><ul class="list-group comment-reply-list-' + data.id + '"></ul><form class="form-horizontal comment-upvote-form" id="' + data.id + '" action="/post/togglecommentupvote" method="post"><input type="hidden" name="csrfmiddlewaretoken" value="'+ csrf + '"><input type="hidden" value="' + data.id + '" name="id"><input type="hidden" id="state-comment-' + data.id + '" value="0" name="state"><button type="submit" id="btn-comment-' + data.id + '" class="post-actions-button small-p"><i class="fa fa-thumbs-up"></i> (0)</button> |</form><form class="form-horizontal comment-reply-form" id="' + data.id + '" action="/post/reply_comment" method="post"><input type="hidden" name="csrfmiddlewaretoken" value="'+csrf+'"><input type="text" name="comment_text" placeholder="What are your thoughts..." required="" id="id_comment_text"><input type="hidden" value="' + data.id + '" name="id"><button type="submit" style="display: inline-block;">Reply</button></form></li>';*/
		var new_comment = '<li class="list-group-item comment" style="background-color: #f7f7f7;"><p>' + data.text + '</p><p><a href="/@'+ data.author + '">@'+data.author+'</a><br><span class="blog-date"> on ' + data.date + '</span></p><ul class="list-group comment-reply-list-' + data.id + '"></ul><form class="form-horizontal comment-upvote-form" id="' + data.id + '" action="/post/togglecommentupvote" method="post"><input type="hidden" name="csrfmiddlewaretoken" value="'+ csrf + '"><input type="hidden" value="' + data.id + '" name="id"><input type="hidden" id="state-comment-' + data.id + '" value="0" name="state"><button type="submit" id="btn-comment-' + data.id + '" class="post-actions-button small-p"><i class="fa fa-thumbs-up"></i> (0) Upvote</button></form><form class="form-horizontal comment-reply-form" id="' + data.id + '" action="/post/reply_comment" method="post"><input type="hidden" name="csrfmiddlewaretoken" value="'+csrf+'"><input class="form-control" type="text" name="comment_text" autocomplete="off" required="" id="id_comment_text"><input type="hidden" value="' + data.id + '" name="id"><button type="submit" class="btn btn-wire-dark-simple" style="float:right;margin-top: 5px;">Add a Reply</button></form></li>';

		var comment_id = '#comment-'+ data.id;
		$(".comment-list").prepend(new_comment);

		   // animate
	   // $('html, body').animate({
	   //     scrollTop: $(comment_id).offset().top - 20
	   //   }, 300);

	}

	//For comment reply
	$(document).on('submit', '.comment-reply-form', function(e) {
		e.preventDefault();
		e.stopPropagation();
		var $form = $(this);
		var url = $form.attr("action");
		$.post(url, $form.serialize())
			.done(function(data) {
				addCommentReply(data);
				$form[0].reset();
			});
	});

	function addCommentReply(data){
		var csrf = $("input[name='csrfmiddlewaretoken']").first().val();
		var new_reply = '<li class="list-group-item reply"><p>'+ data.text + '</p><p><a href="/@'+ data.author + '"><span class="small-p">'+ data.author +'</span></a><span class="blog-date"> on '+ data.date +'</span><form class="form-horizontal comment-upvote-form" id="' + data.id + '" action="/post/togglecommentupvote" method="post"><input type="hidden" value="' + data.id + '" name="id"><input type="hidden" name="csrfmiddlewaretoken" value="' + csrf + '"><input type="hidden" id="state-comment-' + data.id + '" value="0" name="state"><button type="submit" id="btn-comment-' + data.id + '" class="post-actions-button small-p"><i class="fa fa-thumbs-up"></i> (0) Upvote</button></form></li>';
		$(".comment-reply-list-"+data.parent_id).append(new_reply);
	}


	// For Blog Upvotes
  $(document).on('submit', '.upvote-form',function(e) {
      e.preventDefault();
      e.stopPropagation();
      var $form = $(this);
      var url = $form.attr( "action" );
      var thisId = $form.attr( "id" );
      $.post(url, $form.serialize())
          .done(function(data) {
						if(data.user === "none"){
							window.location = '/login/';
						} else {
							changeButton(data, thisId);
						}
          });
  });

    function changeButton(data, id){
      if(data.state){
        $("#btn-"+id).addClass("upvoted");
      	$("#btn-"+id).html('<i class="fa fa-thumbs-up"></i> ('+data.upvotes+') Upvoted');
      }
      else {
        $("#btn-"+id).removeClass("upvoted");
      	$("#btn-"+id).html('<i class="fa fa-thumbs-up"></i> ('+data.upvotes+') Upvote');
      }
      $("#state-"+id).val(data.state ? 1 : 0);
    }

		// For Comment Upvotes
		$(document).on('submit', '.comment-upvote-form',function(e) {
	      e.preventDefault();
	      e.stopPropagation();
	      var $form = $(this);
	      var url = $form.attr( "action" );
	      var thisId = $form.attr( "id" );
	      $.post(url, $form.serialize())
	          .done(function(data) {
	              changeCommentUpvoteButton(data, thisId);
	          });
	  });

	    function changeCommentUpvoteButton(data, id){
	      if(data.state){
	        $("#btn-comment-"+id).addClass("upvoted");
					$("#btn-comment-"+id).html('<i class="fa fa-thumbs-up"></i> ('+data.upvotes+') Upvoted');
	      }
	      else {
	        $("#btn-comment-"+id).removeClass("upvoted");
					$("#btn-comment-"+id).html('<i class="fa fa-thumbs-up"></i> ('+data.upvotes+') Upvote');
	      }
	      $("#state-comment-"+id).val(data.state ? 1 : 0);
	    }

			function single_suggestion(item, index){
				var div = '<div class="list-group-item" onClick="fill_comment(this.innerHTML);">' + item + '</div>';
				return div;
			}

			function single_suggestion_reply(item, id){
				var div = '<div class="list-group-item" id="' + id + '" onClick="fill_comment(this.innerHTML, this.id);">' + item + '</div>';
				return div;
			}

			function input_autocomplete(data, id){
				var obj = JSON.parse(data);
				if(id == null){
					$(".mention_suggestions").empty().html(Object.values(obj).map(single_suggestion));
				}
				else {
					$(".mention_suggestions-" + id).empty().html(Object.values(obj).map(
						function(s) { return single_suggestion_reply(s, id) }
					));
				}
			}

			var save = false;
			var text = "";
			var index = -1;
			function get_suggestions(val, id=null){
				if(save){
					text += val.substr(val.length - 1);
					var domain = window.location.hostname;
					$.get("/post/mention_suggestion", {'text': text})
						.done(function(data){
							input_autocomplete(data, id);
						});
				}
				if(val.substr(val.length - 1) == '@'){
					save = true;
					index = val.length - 1;
				}
				if(val.substr(val.length - 1) == ' '){
					save = false;
					text = "";
					index = -1;
				}
			}

			function fill_comment(str, id=null){
				if(id == null){
					var input = document.getElementById("id_comment_text");
				}
				else {
					var input = document.getElementById("input-"+id);
				}
				var cur_val = input.value
				var val = cur_val.substr(0, index + 1);
				input.value = val + str;
			}
