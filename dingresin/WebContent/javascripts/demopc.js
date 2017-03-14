/**
 * Created by liqiao on 8/10/15.
 */

/**
 * _config comes from server-side template. see views/index.jade
 */
DingTalkPC.config({
			agentId : _config.agentid,
			corpId : _config.corpId,
			timeStamp : _config.timeStamp,
			nonceStr : _config.nonceStr,
			signature : _config.signature,
			jsApiList : [ 'runtime.info', 'biz.contact.choose',
					'device.notification.confirm', 'device.notification.alert',
					'device.notification.prompt', 'biz.ding.post',
					'biz.util.openLink' ]
		});


DingTalkPC.ready(function() {
	DingTalkPC.biz.navigation.setTitle({
        title: 'Entrance',
        onSuccess: function(data) {
        },
        onFail: function(err) {
            log.e(JSON.stringify(err));
        }
    });
	
	dd.biz.navigation.setIcon({
        showIcon : true,//是否显示icon
        iconIndex : 3,//显示的iconIndex,如上图
        onSuccess : function(result) {
            /*结构
            {
            }*/
            //点击icon之后将会回调这个函数
        },
        onFail : function(err) {
        //jsapi调用失败将会回调此函数
        }
    });
	
//	 alert('dd.ready rocks!');

	DingTalkPC.runtime.info({
		onSuccess : function(info) {
			logger.e('runtime info: ' + JSON.stringify(info));
		},
		onFail : function(err) {
			logger.e('fail: ' + JSON.stringify(err));
		}
	});
	DingTalkPC.ui.pullToRefresh.enable({
	    onSuccess: function() {
	    },
	    onFail: function() {
	    }
	})

	DingTalkPC.biz.navigation.setMenu({
		backgroundColor : "#ADD8E6",
		items : [
			{
				id:"此处可以设置帮助",//字符串
			// "iconId":"file",//字符串，图标命名
			  text:"帮助"
			}
			,
			{
				"id":"2",
			"iconId":"photo",
			  "text":"我们"
			}
			,
			{
				"id":"3",
			"iconId":"file",
			  "text":"你们"
			}
			,
			{
				"id":"4",
			"iconId":"time",
			  "text":"他们"
			}
		],
		onSuccess: function(data) {
			alert(JSON.stringify(data));

		},
		onFail: function(err) {
			alert(JSON.stringify(err));
		}
	});


	DingTalkPC.runtime.permission.requestAuthCode({
		corpId : _config.corpId,
		onSuccess : function(info) {
//			alert('authcode: ' + info.code);
			$.ajax({
				url : 'userinfo?code=' + info.code + '&corpid='
						+ _config.corpId,
				type : 'GET',
				success : function(data, status, xhr) {
					var info = JSON.parse(data);

					document.getElementById("userName").innerHTML = info.name;
					document.getElementById("userId").innerHTML = info.userid;
					
					// 图片
//					if(info.avatar.length != 0){
//			            var img = document.getElementById("userImg");
//			            img.src = info.avatar;
//			                      img.height = '100';
//			                      img.width = '100';
//			          }

				},
				error : function(xhr, errorType, error) {
					logger.e("yinyien:" + _config.corpId);
					alert(errorType + ', ' + error);
				}
			});

		},
		onFail : function(err) {
			alert('fail: ' + JSON.stringify(err));
		}
	});
});

DingTalkPC.error(function(err) {
	alert('dd error: ' + JSON.stringify(err));
});
