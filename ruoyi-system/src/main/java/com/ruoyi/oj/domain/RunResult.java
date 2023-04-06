package com.ruoyi.oj.domain;

public class RunResult {
    /**
     * 测试用例
     */
    private String testcase;
    /**
     * 运行结果
     */
    private String result;

    /**
     * 报错信息
     */
    private String error;

    /**
     * 状态
     */
    private String status;

    public RunResult() {
    }

    public RunResult(String testcase, String result, String error, String status) {
        this.testcase = testcase;
        this.result = result;
        this.error = error;
        this.status = status;
    }

    public String getTestcase() {
        return testcase;
    }

    public void setTestcase(String testcase) {
        this.testcase = testcase;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "RunResult{" +
                "testcase='" + testcase + '\'' +
                ", result='" + result + '\'' +
                ", error='" + error + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
