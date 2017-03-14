/**
 * Created by liqiao on 8/10/15.
 */

/**
 * _config comes from server-side template. see views/index.jade
 */
dd.config({
			agentId : _config.agentid,
			corpId : _config.corpId,
			timeStamp : _config.timeStamp,
			nonceStr : _config.nonceStr,
			signature : _config.signature,
			jsApiList : [ 'runtime.info', 'biz.contact.choose',
					'device.notification.confirm', 'device.notification.alert',
					'device.notification.prompt', 'biz.ding.post',
					'biz.util.openLink','device.base.getUUID','device.base.getInterface',
					'device.launcher.launchApp','device.geolocation.get','biz.map.view',
					'biz.map.locate','biz.map.search','biz.util.scan']
		});


dd.ready(function() {
    dd.biz.navigation.setTitle({
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

	dd.runtime.info({
		onSuccess : function(info) {
			logger.e('runtime info: ' + JSON.stringify(info));
		},
		onFail : function(err) {
			logger.e('fail: ' + JSON.stringify(err));
		}
	});
	dd.ui.pullToRefresh.enable({
	    onSuccess: function() {
	    },
	    onFail: function() {
	    }
	})

	dd.biz.navigation.setMenu({
		backgroundColor : "#ADD8E6",
		items : [
			{
				id:"此处可以设置帮助",//字符串
			// "iconId":"file",//字符串，图标命名
			  "iconId":"setting",	
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

//获取微应用免登授权码
	dd.runtime.permission.requestAuthCode({
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
	
	//获取通用唯一识别码
	dd.device.base.getUUID({
	    onSuccess : function(data) {
	        /*
	        {
	            uuid: '3udbhg98ddlljokkkl' //
	        }
	        */
	    	//alert(data.uuid);
	    	document.getElementById("userunitId").innerHTML = data.uuid;
	    },
	    onFail : function(err) {}
	});
	
	//获取热点接入信息
	dd.device.base.getInterface({
	    onSuccess : function(data) {
	        /*
	        {
	            ssid: 'alibaba-inc',
	            macIp: '3c:12:aa:09'
	        }
	        */
	    	//alert(data.macIp);
	    	document.getElementById("userwifiId").innerHTML = data.macIp;
	    },
	    onFail : function(err) {}
	});
	
			
});

dd.error(function(err) {
	alert('dd error: ' + JSON.stringify(err));
});

function showLocation(){
	
	dd.device.geolocation.get({
	    targetAccuracy :200,
	    coordinate : 1,
	    withReGeocode : Boolean,
	    onSuccess : function(result) {
	        /* 高德坐标 result 结构
	        {
	            longitude : Number,
	            latitude : Number,
	            accuracy : Number,
	            address : String,
	            province : String,
	            city : String,
	            district : String,
	            road : String,
	            netType : String,
	            operatorType : String,
	            errorMessage : String,
	            errorCode : Number,
	            isWifiEnabled : Boolean,
	            isGpsEnabled : Boolean,
	            isFromMock : Boolean,
	            provider : wifi|lbs|gps,
	            accuracy : Number,
	            isMobileEnabled : Boolean
	        }
	        */
	    	
	    	//alert(result.latitude + "," + result.longitude);
	    	dd.biz.map.locate({
	    		latitude: result.latitude, // 纬度
	    	    longitude: result.longitude, // 经度
	    	    onSuccess: function (resultlocate) {
	    	        /* result 结构 
	    	        {
	    	            province: 'xxx', // POI所在省会
	    	            provinceCode: 'xxx', // POI所在省会编码
	    	            city: 'xxx', // POI所在城市
	    	            cityCode: 'xxx', // POI所在城市
	    	            adName: 'xxx', // POI所在区名称
	    	            adCode: 'xxx', // POI所在区编码
	    	            distance: 'xxx', // POI与设备位置的距离
	    	            postCode: 'xxx', // POI的邮编
	    	            snippet: 'xxx', // POI的街道地址
	    	            title: 'xxx', // POI的名称
	    	            latitude: 39.903578, // POI的纬度
	    	            longitude: 116.473565, // POI的经度
	    	        }*/

	    	    },
	    	    onFail: function (err) {
	    	    }
	    	});
	    	
	    	
	    },
	    onFail : function(err) {
	    	alert('location error: ' + JSON.stringify(err));
	    }
	});
	
}    //function end


function scanString(){
	
	dd.biz.util.scan({
	    type: String,//type为qrCode或者barCode
	    onSuccess: function(data) {
	    //onSuccess将在扫码成功之后回调
	      /* data结构
	        { 'text': String}
	      */
	    	alert("你扫描的内容是:"+data.text);
	    },
	   onFail : function(err) {
	   }
	})
	
}   //function end

