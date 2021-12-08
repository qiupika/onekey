#!/usr/bin/env bash

# Build 20211208-003-test

name_js=(
  jd_fruit
  jd_pet
  jd_plantBean
  jd_dreamFactory
  jd_jdfactory
  jd_crazy_joy
  jd_jdzz
  jd_jxnc
  jd_bookshop
  jd_cash
  jd_sgmh
  jd_cfd
  jd_health
  jd_carnivalcity
  jd_city
  jd_moneyTree
  jd_cfdtx
)
name_config=(
  Fruit
  Pet
  Bean
  DreamFactory
  JdFactory
  Joy
  Jdzz
  Jxnc
  BookShop
  Cash
  Sgmh
  Cfd
  Health
  Carni
  City
  MoneyTree
  TokenJxnc
)
name_chinese=(
  东东农场
  东东萌宠
  京东种豆得豆
  京喜工厂
  东东工厂
  crazyJoy任务
  京东赚赚
  京喜农场
  口袋书店
  签到领现金
  闪购盲盒
  京喜财富岛
  东东健康社区
  京东手机狂欢城
  城城领现金
  摇钱树
  京喜token
)
env_name=(
  FRUITSHARECODES                     ## 1、东东农场互助码
  PETSHARECODES                       ## 2、东东萌宠互助码
  PLANT_BEAN_SHARECODES               ## 3、种豆得豆互助码
  DREAM_FACTORY_SHARE_CODES           ## 4、京喜工厂互助码
  DDFACTORY_SHARECODES                ## 5、东东工厂互助码
  JDJOY_SHARECODES                    ## 6、疯狂的JOY互助码
  JDZZ_SHARECODES                     ## 7、京东赚赚互助码
  JXNC_SHARECODES                     ## 8、京喜农场助力码
  BOOKSHOP_SHARECODES                 ## 9、口袋书店互助码
  JD_CASH_SHARECODES                  ## 10、签到领现金互助码
  JDSGMH_SHARECODES                   ## 11、闪购盲盒互助码
  JDCFD_SHARECODES                    ## 12、京喜财富岛互助码
  JDHEALTH_SHARECODES                 ## 13、东东健康社区互助码
  JD818_SHARECODES                    ## 14、京东手机狂欢城互助码
  CITY_SHARECODES                     ## 15、城城领现金互助码
  MONEYTREE_SHARECODES                ## 16、摇钱树
  JXNCTOKENS                          ## 17、京喜Token(京喜财富岛提现用)
)
var_name=(
  ForOtherFruit                       ## 1、东东农场互助规则
  ForOtherPet                         ## 2、东东萌宠互助规则
  ForOtherBean                        ## 3、种豆得豆互助规则
  ForOtherDreamFactory                ## 4、京喜工厂互助规则
  ForOtherJdFactory                   ## 5、东东工厂互助规则
  ForOtherJoy                         ## 6、疯狂的JOY互助规则
  ForOtherJdzz                        ## 7、京东赚赚互助规则
  ForOtherJxnc                        ## 8、京喜农场助力码
  ForOtherBookShop                    ## 9、口袋书店互助规则
  ForOtherCash                        ## 10、签到领现金互助规则
  ForOtherSgmh                        ## 11、闪购盲盒互助规则
  ForOtherCfd                         ## 12、京喜财富岛互助规则
  ForOtherHealth                      ## 13、东东健康社区互助规则
  ForOtherCarni                       ## 14、京东手机狂欢城互助规则
  ForOtherCity                        ## 15、城城领现金互助规则
  ForOtherMoneyTree                   ## 16、摇钱树
  TokenJxnc                           ## 17、京喜Token(京喜财富岛提现用)
)

local_scr=$1
repo_dir=""
sub_dir_scripts="$(ls -l $dir_scripts |awk '/^d/ {print $NF}')"
if [[ ! $local_scr =~ "/" ]] || [[ $local_scr == $dir_scripts/[^/]* ]]; then
    local_scr_dir="$dir_scripts"
elif [[ $local_scr == */* ]] && [[ ! $local_scr =~ ql ]]; then
    repo_dir="$(echo $local_scr | awk -F '/' '{print $(NF-1)}')"
    [[ $sub_dir_scripts[@] =~ $repo_dir ]] && local_scr_dir="$dir_scripts/$repo_dir"
else
    local_scr_dir=""
fi

## 生成pt_pin清单
gen_pt_pin_array() {
    source $file_env
    ori_jdCookie=$JD_COOKIE
    ori_envs=$(eval echo "\$ori_jdCookie")
    ori_array=($(echo $ori_envs | sed 's/&/ /g'))
    local i j ori_pt_pin_temp
    for i in "${!ori_array[@]}"; do
        j=$((i + 1))
        ori_pt_pin_temp=$(echo ${ori_array[i]} | perl -pe "{s|.*pt_pin=([^; ]+)(?=;?).*|\1|; s|%|\\\x|g}")
        ori_remark_name[i]="$(cat $dir_db/env.db | grep ${ori_array[i]} | grep remarks | perl -pe "{s|.*remarks\":\"([^\"]+).*|\1|g}" | tail -1)"
        [[ ! ${ori_remark_name[i]} ]] && ori_remark_name[i]="未备注"
        [[ $ori_pt_pin_temp == *\\x* ]] && ori_pt_pin[i]=$(printf $ori_pt_pin_temp) || ori_pt_pin[i]=$ori_pt_pin_temp
        ori_sn=$j
        ori_uesr_info[i]="序号 $j. 用户名：${ori_pt_pin[i]} 备注：${ori_remark_name[i]}"
    done
}

export_uesr_info(){
for i in $@; do
    for j in "${!ori_array[@]}"; do
        [[ ${ori_array[j]} == *$i* ]] && echo ${ori_uesr_info[j]}
    done
done
}

# Cookie 有效性检查
check_jd_ck(){
    local test_jd_cookie="$(curl -s --connect-timeout 5 --retry 3 --noproxy "*" "https://bean.m.jd.com/bean/signIndex.action" -H "cookie: $1")"
    [[ "$test_jd_cookie" ]] && return 0 || return 1
}

# 移除失效的 Cookie
remove_void_ck(){
    gen_pt_pin_array
    local tmp_jdCookie i j void_ck_num
    if [[ $jdCookie_1 ]]; then
        tmp_jdCookie=$jdCookie_1
    else
        source $file_env
        tmp_jdCookie=$JD_COOKIE
    fi
    local envs=$(eval echo "\$tmp_jdCookie")
    local array=($(echo $envs | sed 's/&/ /g'))
    local user_sum=${#array[*]}
    local test_connect="$(curl -I -s --connect-timeout 5 --retry 3 --noproxy "*" https://bean.m.jd.com/bean/signIndex.action -w %{http_code} | tail -n1)"
    echo -e "# 开始检测 Cookie 的有效性，可能花费一定时间，请耐心等待 ..."
    if [ "$test_connect" -eq "302" ]; then
        echo -e "# 本次一共导入 $user_sum 个 Cookie ，其中："
        for ((i = 0; i < $user_sum; i++)); do
            j=$((i + 1))
            check_jd_ck ${array[i]}
            [[ $? = 0 ]] && echo -e "# `export_uesr_info ${array[i]}` 状态正常"
            [[ $? = 1 ]] && echo -e "# `export_uesr_info ${array[i]}` 已失效" && unset array[i]
        done
        jdCookie_2=$(echo ${array[*]} | sed 's/\ /\&/g')
        [[ $jdCookie_2 ]] && export JD_COOKIE="$jdCookie_2"
        void_ck_num=$((user_sum - ${#array[*]}))
        [[ $void_ck_num = 0 ]] && echo -e "# 未检测到失效 Cookie 。" || echo -e "# 已剔除以上 $void_ck_num 个失效的 Cookie 。"
    else
        echo -e "# API 连接失败，跳过检测。"
    fi
    echo -e ""
}

## 临时禁止账号运行活动脚本
TempBlock_CK(){
    ## 按 Cookie 序号禁止账号
    TempBlock_JD_COOKIE(){
        ## 导入基础 JD_COOKIE 变量
        source $file_env
        local tmp_jdCookie=$JD_COOKIE
        local envs=$(eval echo "\$tmp_jdCookie")
        local array=($(echo $envs | sed 's/&/ /g'))
        local user_sum=${#array[*]}
        local TempBlockCookie="$(eval echo $(echo $TempBlockCookie | perl -pe "{s|~\|-|_|g; s|\W+\|[A-Za-z]+| |g; s|(\d+)_(\d+)|{\1..\2}|g;}"))"
        local TempBlockPin="$(echo $TempBlockPin | perl -pe "{s|,| |g;}")"
        local TempBlockCookieArray=($TempBlockCookie)
        local TempBlockPinArray=($TempBlockPin)
        local i j k m jdCookie_3
        for ((i = 1; i <= $user_sum; i++)); do
            j=$((i - 1))
            for ((k = 0; k < ${#TempBlockCookieArray[*]}; k++)); do
                [[ "${TempBlockCookieArray[k]}" = "$i" ]] && unset array[j]
            done
            pt_pin_temp=$(echo ${array[j]} | perl -pe "{s|.*pt_pin=([^; ]+)(?=;?).*|\1|; s|%|\\\x|g}")
            [[ $pt_pin_temp == *\\x* ]] && pt_pin[j]=$(printf $pt_pin_temp) || pt_pin[j]=$pt_pin_temp
            for ((m = 0; m < ${#TempBlockPinArray[*]}; m++)); do
                pt_pin_temp_block=$(echo ${TempBlockPinArray[m]} | perl -pe "{s|%|\\\x|g}")
                [[ $pt_pin_temp_block == *\\x* ]] && pt_pin_block[m]=$(printf $pt_pin_temp_block) || pt_pin_block[m]=$pt_pin_temp_block
                [[ "${pt_pin[j]}" =~ "${pt_pin_block[m]}" ]] && unset array[j]
            done
        done
        jdCookie_1=$(echo ${array[*]} | sed 's/\ /\&/g')
        [[ $jdCookie_1 ]] && export JD_COOKIE="$jdCookie_1"
        user_sum_1=${#array[*]}
    }

    local i j k
    if [[ -n "$(echo $tempblock_ck_envs_num|sed -n "/^[0-9]\+$/p")" ]]; then
        for ((k = 1; k <= $tempblock_ck_envs_num; k++)); do
            if [ tempblock_ck_envs$k ]; then
                local tempblock_ck_array=($(eval echo "\$tempblock_ck_envs$k" | perl -pe "{s|&| |g}"))
                for i in "${tempblock_ck_array[@]}"; do
                    local tmp_task_array=($(echo $i | perl -pe "{s|@| |g}"))
                    local tmp_script_array=($(echo ${tmp_task_array[0]} | perl -pe "{s/\|/ /g}"))
                    for j in ${tmp_script_array[@]}; do
                        if [[ $local_scr == *$j* ]]; then
                            [[ $(echo ${tmp_task_array[1]} | perl -pe "{s|\D||g;}") ]] && TempBlockCookie=${tmp_task_array[1]} || TempBlockCookie=""
                            TempBlockPin=${tmp_task_array[2]}
                            break
                        fi
                    done
                done
            fi
        done
    fi
    if [[ $TempBlockCookie ]] || [[ $TempBlockPin ]]; then
        TempBlock_JD_COOKIE
    else
        export JD_COOKIE="$tmp_jdCookie"
    fi
}

## 重组 CK
Recombin_CK(){
    ## 导入基础 JD_COOKIE 变量
    if [[ $jdCookie_2 ]]; then
        tmp_jdCookie=$jdCookie_2
    elif [[ $jdCookie_1 ]]; then
        tmp_jdCookie=$jdCookie_1
    else
        source $file_env
        tmp_jdCookie=$JD_COOKIE
    fi

    ## JD_COOKIE 基本分析
    local envs=$(eval echo "\$tmp_jdCookie")
    array=($(echo $envs | sed 's/&/ /g'))
    user_sum=${#array[*]}
    local jdCookie_4 i j k m n
    if [[ -n "$(echo $recombin_ck_envs_num|sed -n "/^[0-9]\+$/p")" ]]; then
        for ((k = 1; k <= $recombin_ck_envs_num; k++)); do
            if [ recombin_ck_envs$k ]; then
                local recombin_ck_array=($(eval echo "\$recombin_ck_envs$k" | perl -pe "{s|&| |g}"))
                for i in "${recombin_ck_array[@]}"; do
                    local tmp_task_array=($(echo $i | perl -pe "{s|@| |g}"))
                    local tmp_script_array=($(echo ${tmp_task_array[0]} | perl -pe "{s/\|/ /g}"))
                    #[[ $DEBUG_MODE = 1 ]]  && echo ${tmp_script_array[@]}
                    for j in "${tmp_script_array[@]}"; do
                        if [[ $local_scr == *$j* ]]; then
                            [[ $DEBUG_MODE = 1 ]] && echo -n "${tmp_script_array[@]}" && echo -e "\n"
                            Recombin_CK_Mode="${tmp_task_array[1]}"
                            for ((m = 1; m <= 5; m++)); do
                                n=$((m + 1))
                                eval Recombin_CK_ARG$m="${tmp_task_array[n]}"
                                [[ $DEBUG_MODE = 1 ]] && eval echo "Recombin_CK_ARG$m : \$Recombin_CK_ARG$m"
                            done
                            local temp_status=1
                            [[ $Recombin_CK_Mode = 4 || $Recombin_CK_Mode = 5 ]] && Recombin_CK_cal && break 4 || Recombin_CK_cal
                        fi
                    done
          
