# 中文的Readme

!> 一段重要的内容，可以和其他 **Markdown** 语法混用。


```java
/**
 * 版本检查控制器
 *
 * @author qinkangdeid
 * @date 2020/03/14 15:06:08
 */
@RestController
@RequestMapping("baibuapp")
public class CheckVersionController {


    @Resource
    private BaibuVersionCheckFecade baibuVersionCheckFecade;

    /**
     * 检查版本更新
     *
     * @param req 参数
     * @return {@link DataResponse<CheckVersionVo>}
     * @module 重写接口
     */
    @PostMapping("/check/version")
    public DataResponse<CheckVersionVo> checkVersion(@RequestBody @Valid CheckVersionReq req) {
        return baibuVersionCheckFecade.checkVersion(req);
    }


}



```


