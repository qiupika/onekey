## Version: v2.8.0
## Date: 2021-06-20
## Mod: Build 20211204-002
## Update Content: 可持续发展纲要\n1. session管理破坏性修改\n2. 配置管理可编辑config下文件\n3. 自定义脚本改为查看脚本\n4. 移除互助相关

## 上面版本号中，如果第2位数字有变化，那么代表增加了新的参数，如果只有第3位数字有变化，仅代表更新了注释，没有增加新的参数，可更新可不更新

## 在运行 ql repo 命令时，是否自动删除失效的脚本与定时任务
AutoDelCron="true"

## 在运行 ql repo 命令时，是否自动增加新的本地定时任务
AutoAddCron="true"

## 拉取脚本时默认的定时规则，当匹配不到定时规则时使用，例如: 0 9 * * *
DefaultCronRule="37 0 * * *"

## ql repo命令拉取脚本时需要拉取的文件后缀，直接写文件后缀名即可
RepoFileExtensions="js py sh ts"

## 由于github仓库拉取较慢，所以会默认添加代理前缀，如不需要请移除
GithubProxyUrl="https://ghproxy.com/"

## 设置定时任务执行的超时时间，默认1h，后缀"s"代表秒(默认值), "m"代表分, "h"代表小时, "d"代表天
CommandTimeoutTime="3h"

## 设置批量执行任务时的并发数，默认同时执行5个任务
MaxConcurrentNum="20"

## 在运行 task 命令时，随机延迟启动任务的最大延迟时间
## 默认给javascript任务加随机延迟，如 RandomDelay="300" ，表示任务将在 1-300 秒内随机延迟一个秒数，然后再运行，取消延迟赋值为空
RandomDelay=""

## 如果你自己会写shell脚本，并且希望在每次运行 ql update 命令时，额外运行你的 shell 脚本，请赋值为 "true"，默认为true
EnableExtraShell="true"

## 是否自动启动bot，默认不启动，设置为true时自动启动，目前需要自行克隆bot仓库所需代码，存到ql/repo目录下，文件夹命名为dockerbot
AutoStartBot="true"

## 安装bot依赖时指定pip源，默认使用清华源，如不需要源，设置此参数为空
PipMirror="https://pypi.tuna.tsinghua.edu.cn/simple"

## 通知环境变量
## 1. Server酱
## https://sct.ftqq.com
## 下方填写 SCHKEY 值或 SendKey 值
export PUSH_KEY=""

## 2. BARK
## 下方填写app提供的设备码，例如：https://api.day.app/123 那么此处的设备码就是123
export BARK_PUSH=""
## 下方填写推送声音设置，例如choo，具体值请在bark-推送铃声-查看所有铃声
export BARK_SOUND=""
## 下方填写推送消息分组，默认为"QingLong"
export BARK_GROUP="QingLong"

## 3. Telegram 
## 下方填写自己申请@BotFather的Token，如10xxx4:AAFcqxxxxgER5uw
export TG_BOT_TOKEN=""
## 下方填写 @getuseridbot 中获取到的纯数字ID
export TG_USER_ID=""
## Telegram 代理IP（选填）
## 下方填写代理IP地址，代理类型为 http，比如您代理是 http://127.0.0.1:1080，则填写 "127.0.0.1"
## 如需使用，请自行解除下一行的注释
export TG_PROXY_HOST=""
## Telegram 代理端口（选填）
## 下方填写代理端口号，代理类型为 http，比如您代理是 http://127.0.0.1:1080，则填写 "1080"
## 如需使用，请自行解除下一行的注释
export TG_PROXY_PORT=""
## Telegram 代理的认证参数（选填）
export TG_PROXY_AUTH=""
## Telegram api自建反向代理地址（选填）
## 教程：https://www.hostloc.com/thread-805441-1-1.html
## 如反向代理地址 http://aaa.bbb.ccc 则填写 aaa.bbb.ccc
## 如需使用，请赋值代理地址链接，并自行解除下一行的注释
export TG_API_HOST=""

## 4. 钉钉 
## 官方文档：https://developers.dingtalk.com/document/app/custom-robot-access
## 下方填写token后面的内容，只需 https://oapi.dingtalk.com/robot/send?access_token=XXX 等于=符号后面的XXX即可
export DD_BOT_TOKEN=""
export DD_BOT_SECRET=""

## 5. 企业微信机器人
## 官方说明文档：https://work.weixin.qq.com/api/doc/90000/90136/91770
## 下方填写密钥，企业微信推送 webhook 后面的 key
export QYWX_KEY=""

## 6. 企业微信应用
## 参考文档：http://note.youdao.com/s/HMiudGkb
## 下方填写素材库图片id（corpid,corpsecret,touser,agentid），素材库图片填0为图文消息, 填1为纯文本消息
export QYWX_AM=""

## 7. iGot聚合
## 参考文档：https://wahao.github.io/Bark-MP-helper
## 下方填写iGot的推送key，支持多方式推送，确保消息可达
export IGOT_PUSH_KEY=""

## 8. Push Plus
## 官方网站：http://www.pushplus.plus
## 下方填写您的Token，微信扫码登录后一对一推送或一对多推送下面的token，只填 PUSH_PLUS_TOKEN 默认为一对一推送
export PUSH_PLUS_TOKEN=""
## 一对一多推送（选填）
## 下方填写您的一对多推送的 "群组编码" ，（一对多推送下面->您的群组(如无则新建)->群组编码）
## 1. 需订阅者扫描二维码 2、如果您是创建群组所属人，也需点击“查看二维码”扫描绑定，否则不能接受群组消息推送
export PUSH_PLUS_USER=""

## 仅指定的脚本采用 pushplus 推送
## case $1 in
##     ccwav_QLScript2_jd_bean_change* | ccwav_QLScript2_jd_CheckCK* | *jd_scripts_jd_dreamFactory* | *jd_jxgc* | *jd_pigPet* )
##         export PUSH_PLUS_TOKEN=""                                                                                             ##填写 pushplus 的 token
##         export PUSH_PLUS_USER=""                                                                                              #填写 pushplus 的群组名称，不填的话只推送到 pushplus 的个人消息
##         ;;
##     *)
##         export PUSH_PLUS_TOKEN=""                                                                                             ##必填项。默认为空，表示其他脚本不推送 pushplus。
##         export PUSH_PLUS_USER=""                                                                                              ##必填项。默认为空，表示其他脚本不推送 pushplus 群组。
##         ;;
## esac

## 9. go-cqhttp
## gobot_url 推送到个人QQ: http://127.0.0.1/send_private_msg  群：http://127.0.0.1/send_group_msg 
## gobot_token 填写在go-cqhttp文件设置的访问密钥
## gobot_qq 如果GOBOT_URL设置 /send_private_msg 则需要填入 user_id=个人QQ 相反如果是 /send_group_msg 则需要填入 group_id=QQ群 
## go-cqhttp相关API https://docs.go-cqhttp.org/api
export GOBOT_URL=""
export GOBOT_TOKEN=""
export GOBOT_QQ=""

## 10 临时禁止Cookie
### 分为 按 Cookie 序号、按 pt_pin(用户名) 2 种模式禁止将 Cookie 提交活动脚本：
### 其他说明：①全局模式和局部模式可同时生效；
###           ②支持黑名单模式(即不使用该模式，详见 局部模式环境变量 recombin_ck_envs 说明)；

## 10.1 全局模式选项
### 赋值要求：①TempBlockCookie 只能填数字或者区间，表示按 Cookie 序号禁止账号；
###           ②TempBlockPin 只能填写 pt_pin 值 或者 用户名(支持中文)，表示按 pt_pin 或者 用户名(支持中文) 禁止账号。
###           ③对全部脚本有效(除非 recombin_ck_envs 另有设定)；
###           ⑧例如：TempBlockCookie="1,2,5_8,12~19 20"，表示第 1、2、5至8、12至19、20位账号均被禁止参加活动。数字与数字，数字与区间之间可用 ~、_、空格隔开； ；
###           ⑧例如：TempBlockPin="张三 jd_13134567890,%E7%95%AA%E8%8C%84%E5%8A%A0%E4%B8%AA%E8%9B%8B"，表示 张三、jd_13134567890、番茄加个蛋、这几个账号均被禁止参加活动。各账号间可用 , 或空格隔开；
TempBlockCookie=""
TempBlockPin=""

## 10.2 局部模式环境变量
### 释义：脚本1文件名关键词@参数1@参数2；
### 赋值要求：①脚本文件名关键词，例如，东东农场的活动脚本关键词 jd_fruit；多个脚本关键词采用 | 符号分隔。例如：jd_fruit|jd_dreamFactory；
###           ②脚本文件名关键词与各参数采用 @ 连接。释义附后。如果不设定参数1，表示该脚本所有账号参加活动(即：黑名单)；
###           ③参数1。表示 TempBlockCookie。不能有空格，建议序号与序号、序号与区间采用 , 分隔；
###           ④参数2。表示 TempBlockPin。不能有空格，建议各pt_pin(或用户名)采用 , 分隔；
###           ⑤各个活动设定值之间采用 & 连接，例如：jd_fruit|jd_dreamFactory@1,3-4,7~9&jd_plantBean@2,4-6,8@张三&jd_pigPet@-@张三&jd_plantBean；
###               jd_fruit|jd_dreamFactory@1,3-5,7~9   使用模式：按序号，1、3至5、7至9不参加活动
###               jd_plantBean@2,4-6,8@张三            使用模式：按序号，2、4至6、8不参加活动，且张三也不参加活动
###               jd_pigPet@-@张三                     使用模式：按pt_pin或用户名，张三不参加活动。注意，参数1位置需要加一个 - 作为占位符
###               jd_plantBean                         使用模式：所有账号参加活动

## 10.2.1 局部模式环境变量的启用数量
### 释义：顾名思义；
### 赋值要求：①正整数。如果填写 3 ，表示 tempblock_ck_envs1 ~ tempblock_ck_envs3 生效；
tempblock_ck_envs_num=""
## 10.2.2 多组环境变量
### 释义：可以自由定义多组局部模式环境变量，如果多组变量中针对同一个脚本设置了多次变量，第一次变量有效，其他变量无效；
### 赋值要求：详见“局部模式环境变量”赋值要求；
# tempblock_ck_envs1="jd_fruit@1,3-4,7~9&jd_plantBean@2,4-6,8@张三&jd_pigPet@-@张三&jd_plantBean"
# tempblock_ck_envs2="Check|jd_islogin_xh@3-5@法外狂徒"
tempblock_ck_envs1=""
tempblock_ck_envs2=""

## 11 重组Cookie
### 分为 随机、优先、轮换、组队和分段 5 种模式：
### 1、随机模式：支持自定义从所有 Cookie 中随机抽取若干数量的账号按随机顺序参加活动；
### 2、优先模式：支持自定义前若干数量的账号固定按照正常顺序参加活动，其余账号按随机顺序参加活动；
### 3、轮换模式：支持自定义前若干数量的账号固定按照正常顺序参加活动，其余账号按轮换模式参加活动。所谓轮换就是指若干数量的账号每过一天挪动到 Cookie 队伍末尾；
### 4、组队模式：只支持 js 脚本。根据游戏规则每支队伍的成员数量、每个账号能发起的组队次数上限自动按顺序参加活动。
### 5、分段模式：只支持 js 脚本。支持自定义按若干数量拆分账号，按分段顺序参加活动。支持各段启动活动脚本的延隔时间。
### 其他说明：①全局模式和局部模式可同时生效；
###           ②支持黑名单模式(即不使用该模式，详见 局部模式环境变量 recombin_ck_envs 说明)；

## 11.1 全局模式选项
### 模式
### 赋值要求：①只能填 1 2 3 4 5，分别表示随机、优先、轮换、组队、分段 5 种模式，对全部脚本有效(除非 recombin_ck_envs 另有设定)；
###           ②若填写为其他内容，则所有账号按正常顺序参加活动(除非 recombin_ck_envs 另有设定)；
Recombin_CK_Mode=""

### 参数 1
### 释义：①在随机模式下：表示随意抽取 N 个账号随机顺序参加活动；
###       ②在优先模式和轮换模式下：表示前 N 个账号固定按正常顺序参加活动；
###       ③在组队模式下：表示每支队伍的成员数量；
###       ④在分段模式下：表示前 N 个账号固定按正常顺序参加活动；
### 赋值要求：①填写不大于 Cookie 总数的 0 或正整数，对全部脚本有效(除非 recombin_ck_envs 另有设定)；
###           ②随机模式和优先模式下：若填写数值为 0 或大于等于 Cookie 总数，则所有账号随机顺序参加活动；
###           ③优先模式下：若填写数值为 0 ，参数缺失，则所有账号切换回正常顺序参加活动；
###           ④轮换模式下：若填写数值为 0 ，表示所有账号参加轮换；若填写数值为大于等于 Cookie 总数，则所有账号切换回正常顺序参加活动；
###           ⑤组队模式下：若填写数值为 0 或其他内容，则所有账号切换回正常顺序参加活动。
###           ⑥分段模式下：若填写数值为 0 ，表示所有账号参与分段；若填写数值为大于等于 Cookie 总数，则所有账号切换回正常顺序参加活动；
Recombin_CK_ARG1=""

### 参数 2
### 释义：①随机模式和优先模式下：无意义；
###       ②轮换模式下：表示自定义 N 个账号/天参加轮换，即单次轮换量设定；
###       ③在组队模式下：表示每个账号发起组队的次数；
###       ④在分段模式下：表示每个分段的账号数量；
### 赋值要求：①轮换模式下：只能填不大于参与轮换账号数量(即：总Cookie数量-固定Cookie数量)的正整数；
###           ②轮换模式下：若填写为其他内容或留空，则自动调整为按天计算单次轮换量(即：参与轮换账号数量÷当月总天数的商值，取上整数)；
###           ③组队模式下：若填写为其他内容或留空，则全部账号切换回正常顺序参加活动。
###           ④分段模式下：只能填大于固定账号数量且不大于 Cookie 总数的数值。若填写为其他内容或留空，则全部账号切换回正常顺序参加活动。
Recombin_CK_ARG2=""

## 重组Cookie前是否剔除失效Cookie
### 释义：①如果开启，会在模式参数已设定的情况下，执行任务前进行 Cookie 有效性验证并剔除失效的 Cookie。受 Cookie 总数量影响任务启动的即时性；
### 赋值要求：①填 1 表示开启，填其他内容或空值表示关闭；
Remove_Void_CK=""

## 11.2 局部模式环境变量
### 释义：脚本1文件名关键词@模式@参数1@参数2@参数3@参数4；
### 赋值要求：①脚本文件名关键词，例如，东东农场的活动脚本关键词 jd_fruit。多个脚本关键词采用 | 符号分隔。例如：jd_fruit|jd_dreamFactory；
###           ②脚本文件名关键词与各参数采用 @ 连接。释义附后。如果不设定参数1，表示该脚本按正常账号顺序参加活动(即：黑名单)；
###           ③模式。表示 Recombin_CK_Mode；
###           ④参数1。表示 Recombin_CK_ARG1；
###           ⑤参数2。表示 Recombin_CK_ARG2；
###           ⑥参数3。表示 Recombin_CK_ARG3；组队模式、分段模式：表示各分段启动活动脚本的延隔时间，支持 d(天)、h(小时)、m（分钟）、s(秒可略写)。如 1d2h3m4s 表示 1天2小时3分钟4秒；
###           ⑦参数4。表示 Recombin_CK_ARG4；组队模式、分段模式：表示各分段启动活动脚本的间隔时间。需参数3为 - 占位符时生效；
###           ⑧参数5。表示 Recombin_CK_ARG5；组队瓜分京豆脚本 (jd_zdjr) ：表示调用 activity_env 变量组(用法附后)的指定环境变量。例如，填 0，表示所有变量执行一次，填 1 表示只调用第 1 组变量。需参数3、参数4已赋值或为 - 占位符时生效；
###           ⑨各个活动设定值之间采用 & 连接。可以针对同一脚本设置多次模式及参数变量，以实现模式迭代组合。当多次变量遇到组队或分段模式时，终止迭代，即：随机、优先、轮换三者间可以无限迭代；这三者与组队、分段其中之一实现单轮迭代；
###           ⑩例如：jd_cfd&jd_fruit|jd_dreamFactory@1@5&jd_pet@2@6&jd_pigPet@3@5&jd_plantBean@3@7@4&jd_jxlhb@4@80@1&jd_islogin_xh@5@4@8&jd_islogin_xh@5@4@8@15&ccwav*speed_sign@5@0@20@-@5400&iroyway*zdjr@3@5&iroyway*zdjr@4@5@4@-@-@1；
###                jd_cfd                                      脚本按正常账号顺序参加活动
###                jd_fruit|jd_dreamFactory@1@5                共用模式：1随机，抽5个CK顺序随机
###                jd_pet@2@6                                  使用模式：2优先，前6个CK顺序优先，其余CK顺序随机
###                jd_pigPet@3@5                               使用模式：3轮换，前5个CK顺序固定，根据CK总数和当月天数自动计算每天轮换CK数量
###                jd_plantBean@3@7@4                          使用模式：3轮换，前7个CK顺序固定，每天轮换4个CK
###                jd_jxlhb@4@80@1                             使用模式：4组队，队伍成员数量80，每个账号组队1次
###                jd_islogin_xh@5@4@8                         使用模式：5分段，前4个CK顺序固定，每段成员数量8，各分段并发执行启动脚本
###                jd_islogin_xh@5@4@8@15                      使用模式：5分段，前4个CK顺序固定，每段成员数量8，每段启动脚本的延隔时间为15秒，即本段开始启动脚本后 15 秒，下一段启动脚本。第 4 个参数表示每个分段启动活动脚本的延隔时间，单位：秒；
###                ccwav*speed_sign@5@0@20@-@5400              ccwav 的 speed_sign 脚本。使用模式：5分段，所有账号参与分段，每段成员数量20，每段启动脚本的间隔时间为 5400 秒即本段脚本执行完成后，等待 5400 秒，下一段启动脚本。当第 4 个参数使用 - 占位符时，第 5 个参数表示每个分段启动活动脚本的间隔时间，单位：秒。
###                ir
