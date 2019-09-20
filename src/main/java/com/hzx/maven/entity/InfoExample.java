package com.hzx.maven.entity;

import java.util.ArrayList;
import java.util.List;

public class InfoExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public InfoExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andLibraryNameIsNull() {
            addCriterion("library_name is null");
            return (Criteria) this;
        }

        public Criteria andLibraryNameIsNotNull() {
            addCriterion("library_name is not null");
            return (Criteria) this;
        }

        public Criteria andLibraryNameEqualTo(String value) {
            addCriterion("library_name =", value, "libraryName");
            return (Criteria) this;
        }

        public Criteria andLibraryNameNotEqualTo(String value) {
            addCriterion("library_name <>", value, "libraryName");
            return (Criteria) this;
        }

        public Criteria andLibraryNameGreaterThan(String value) {
            addCriterion("library_name >", value, "libraryName");
            return (Criteria) this;
        }

        public Criteria andLibraryNameGreaterThanOrEqualTo(String value) {
            addCriterion("library_name >=", value, "libraryName");
            return (Criteria) this;
        }

        public Criteria andLibraryNameLessThan(String value) {
            addCriterion("library_name <", value, "libraryName");
            return (Criteria) this;
        }

        public Criteria andLibraryNameLessThanOrEqualTo(String value) {
            addCriterion("library_name <=", value, "libraryName");
            return (Criteria) this;
        }

        public Criteria andLibraryNameLike(String value) {
            addCriterion("library_name like", value, "libraryName");
            return (Criteria) this;
        }

        public Criteria andLibraryNameNotLike(String value) {
            addCriterion("library_name not like", value, "libraryName");
            return (Criteria) this;
        }

        public Criteria andLibraryNameIn(List<String> values) {
            addCriterion("library_name in", values, "libraryName");
            return (Criteria) this;
        }

        public Criteria andLibraryNameNotIn(List<String> values) {
            addCriterion("library_name not in", values, "libraryName");
            return (Criteria) this;
        }

        public Criteria andLibraryNameBetween(String value1, String value2) {
            addCriterion("library_name between", value1, value2, "libraryName");
            return (Criteria) this;
        }

        public Criteria andLibraryNameNotBetween(String value1, String value2) {
            addCriterion("library_name not between", value1, value2, "libraryName");
            return (Criteria) this;
        }

        public Criteria andMasterNameIsNull() {
            addCriterion("master_name is null");
            return (Criteria) this;
        }

        public Criteria andMasterNameIsNotNull() {
            addCriterion("master_name is not null");
            return (Criteria) this;
        }

        public Criteria andMasterNameEqualTo(String value) {
            addCriterion("master_name =", value, "masterName");
            return (Criteria) this;
        }

        public Criteria andMasterNameNotEqualTo(String value) {
            addCriterion("master_name <>", value, "masterName");
            return (Criteria) this;
        }

        public Criteria andMasterNameGreaterThan(String value) {
            addCriterion("master_name >", value, "masterName");
            return (Criteria) this;
        }

        public Criteria andMasterNameGreaterThanOrEqualTo(String value) {
            addCriterion("master_name >=", value, "masterName");
            return (Criteria) this;
        }

        public Criteria andMasterNameLessThan(String value) {
            addCriterion("master_name <", value, "masterName");
            return (Criteria) this;
        }

        public Criteria andMasterNameLessThanOrEqualTo(String value) {
            addCriterion("master_name <=", value, "masterName");
            return (Criteria) this;
        }

        public Criteria andMasterNameLike(String value) {
            addCriterion("master_name like", value, "masterName");
            return (Criteria) this;
        }

        public Criteria andMasterNameNotLike(String value) {
            addCriterion("master_name not like", value, "masterName");
            return (Criteria) this;
        }

        public Criteria andMasterNameIn(List<String> values) {
            addCriterion("master_name in", values, "masterName");
            return (Criteria) this;
        }

        public Criteria andMasterNameNotIn(List<String> values) {
            addCriterion("master_name not in", values, "masterName");
            return (Criteria) this;
        }

        public Criteria andMasterNameBetween(String value1, String value2) {
            addCriterion("master_name between", value1, value2, "masterName");
            return (Criteria) this;
        }

        public Criteria andMasterNameNotBetween(String value1, String value2) {
            addCriterion("master_name not between", value1, value2, "masterName");
            return (Criteria) this;
        }

        public Criteria andBulidTimeIsNull() {
            addCriterion("bulid_time is null");
            return (Criteria) this;
        }

        public Criteria andBulidTimeIsNotNull() {
            addCriterion("bulid_time is not null");
            return (Criteria) this;
        }

        public Criteria andBulidTimeEqualTo(String value) {
            addCriterion("bulid_time =", value, "bulidTime");
            return (Criteria) this;
        }

        public Criteria andBulidTimeNotEqualTo(String value) {
            addCriterion("bulid_time <>", value, "bulidTime");
            return (Criteria) this;
        }

        public Criteria andBulidTimeGreaterThan(String value) {
            addCriterion("bulid_time >", value, "bulidTime");
            return (Criteria) this;
        }

        public Criteria andBulidTimeGreaterThanOrEqualTo(String value) {
            addCriterion("bulid_time >=", value, "bulidTime");
            return (Criteria) this;
        }

        public Criteria andBulidTimeLessThan(String value) {
            addCriterion("bulid_time <", value, "bulidTime");
            return (Criteria) this;
        }

        public Criteria andBulidTimeLessThanOrEqualTo(String value) {
            addCriterion("bulid_time <=", value, "bulidTime");
            return (Criteria) this;
        }

        public Criteria andBulidTimeLike(String value) {
            addCriterion("bulid_time like", value, "bulidTime");
            return (Criteria) this;
        }

        public Criteria andBulidTimeNotLike(String value) {
            addCriterion("bulid_time not like", value, "bulidTime");
            return (Criteria) this;
        }

        public Criteria andBulidTimeIn(List<String> values) {
            addCriterion("bulid_time in", values, "bulidTime");
            return (Criteria) this;
        }

        public Criteria andBulidTimeNotIn(List<String> values) {
            addCriterion("bulid_time not in", values, "bulidTime");
            return (Criteria) this;
        }

        public Criteria andBulidTimeBetween(String value1, String value2) {
            addCriterion("bulid_time between", value1, value2, "bulidTime");
            return (Criteria) this;
        }

        public Criteria andBulidTimeNotBetween(String value1, String value2) {
            addCriterion("bulid_time not between", value1, value2, "bulidTime");
            return (Criteria) this;
        }

        public Criteria andContactEmailIsNull() {
            addCriterion("contact_email is null");
            return (Criteria) this;
        }

        public Criteria andContactEmailIsNotNull() {
            addCriterion("contact_email is not null");
            return (Criteria) this;
        }

        public Criteria andContactEmailEqualTo(String value) {
            addCriterion("contact_email =", value, "contactEmail");
            return (Criteria) this;
        }

        public Criteria andContactEmailNotEqualTo(String value) {
            addCriterion("contact_email <>", value, "contactEmail");
            return (Criteria) this;
        }

        public Criteria andContactEmailGreaterThan(String value) {
            addCriterion("contact_email >", value, "contactEmail");
            return (Criteria) this;
        }

        public Criteria andContactEmailGreaterThanOrEqualTo(String value) {
            addCriterion("contact_email >=", value, "contactEmail");
            return (Criteria) this;
        }

        public Criteria andContactEmailLessThan(String value) {
            addCriterion("contact_email <", value, "contactEmail");
            return (Criteria) this;
        }

        public Criteria andContactEmailLessThanOrEqualTo(String value) {
            addCriterion("contact_email <=", value, "contactEmail");
            return (Criteria) this;
        }

        public Criteria andContactEmailLike(String value) {
            addCriterion("contact_email like", value, "contactEmail");
            return (Criteria) this;
        }

        public Criteria andContactEmailNotLike(String value) {
            addCriterion("contact_email not like", value, "contactEmail");
            return (Criteria) this;
        }

        public Criteria andContactEmailIn(List<String> values) {
            addCriterion("contact_email in", values, "contactEmail");
            return (Criteria) this;
        }

        public Criteria andContactEmailNotIn(List<String> values) {
            addCriterion("contact_email not in", values, "contactEmail");
            return (Criteria) this;
        }

        public Criteria andContactEmailBetween(String value1, String value2) {
            addCriterion("contact_email between", value1, value2, "contactEmail");
            return (Criteria) this;
        }

        public Criteria andContactEmailNotBetween(String value1, String value2) {
            addCriterion("contact_email not between", value1, value2, "contactEmail");
            return (Criteria) this;
        }

        public Criteria andContactAddressIsNull() {
            addCriterion("contact_address is null");
            return (Criteria) this;
        }

        public Criteria andContactAddressIsNotNull() {
            addCriterion("contact_address is not null");
            return (Criteria) this;
        }

        public Criteria andContactAddressEqualTo(String value) {
            addCriterion("contact_address =", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressNotEqualTo(String value) {
            addCriterion("contact_address <>", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressGreaterThan(String value) {
            addCriterion("contact_address >", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressGreaterThanOrEqualTo(String value) {
            addCriterion("contact_address >=", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressLessThan(String value) {
            addCriterion("contact_address <", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressLessThanOrEqualTo(String value) {
            addCriterion("contact_address <=", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressLike(String value) {
            addCriterion("contact_address like", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressNotLike(String value) {
            addCriterion("contact_address not like", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressIn(List<String> values) {
            addCriterion("contact_address in", values, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressNotIn(List<String> values) {
            addCriterion("contact_address not in", values, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressBetween(String value1, String value2) {
            addCriterion("contact_address between", value1, value2, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressNotBetween(String value1, String value2) {
            addCriterion("contact_address not between", value1, value2, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactPhoneIsNull() {
            addCriterion("contact_phone is null");
            return (Criteria) this;
        }

        public Criteria andContactPhoneIsNotNull() {
            addCriterion("contact_phone is not null");
            return (Criteria) this;
        }

        public Criteria andContactPhoneEqualTo(String value) {
            addCriterion("contact_phone =", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneNotEqualTo(String value) {
            addCriterion("contact_phone <>", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneGreaterThan(String value) {
            addCriterion("contact_phone >", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("contact_phone >=", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneLessThan(String value) {
            addCriterion("contact_phone <", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneLessThanOrEqualTo(String value) {
            addCriterion("contact_phone <=", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneLike(String value) {
            addCriterion("contact_phone like", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneNotLike(String value) {
            addCriterion("contact_phone not like", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneIn(List<String> values) {
            addCriterion("contact_phone in", values, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneNotIn(List<String> values) {
            addCriterion("contact_phone not in", values, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneBetween(String value1, String value2) {
            addCriterion("contact_phone between", value1, value2, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneNotBetween(String value1, String value2) {
            addCriterion("contact_phone not between", value1, value2, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactWebIsNull() {
            addCriterion("contact_web is null");
            return (Criteria) this;
        }

        public Criteria andContactWebIsNotNull() {
            addCriterion("contact_web is not null");
            return (Criteria) this;
        }

        public Criteria andContactWebEqualTo(String value) {
            addCriterion("contact_web =", value, "contactWeb");
            return (Criteria) this;
        }

        public Criteria andContactWebNotEqualTo(String value) {
            addCriterion("contact_web <>", value, "contactWeb");
            return (Criteria) this;
        }

        public Criteria andContactWebGreaterThan(String value) {
            addCriterion("contact_web >", value, "contactWeb");
            return (Criteria) this;
        }

        public Criteria andContactWebGreaterThanOrEqualTo(String value) {
            addCriterion("contact_web >=", value, "contactWeb");
            return (Criteria) this;
        }

        public Criteria andContactWebLessThan(String value) {
            addCriterion("contact_web <", value, "contactWeb");
            return (Criteria) this;
        }

        public Criteria andContactWebLessThanOrEqualTo(String value) {
            addCriterion("contact_web <=", value, "contactWeb");
            return (Criteria) this;
        }

        public Criteria andContactWebLike(String value) {
            addCriterion("contact_web like", value, "contactWeb");
            return (Criteria) this;
        }

        public Criteria andContactWebNotLike(String value) {
            addCriterion("contact_web not like", value, "contactWeb");
            return (Criteria) this;
        }

        public Criteria andContactWebIn(List<String> values) {
            addCriterion("contact_web in", values, "contactWeb");
            return (Criteria) this;
        }

        public Criteria andContactWebNotIn(List<String> values) {
            addCriterion("contact_web not in", values, "contactWeb");
            return (Criteria) this;
        }

        public Criteria andContactWebBetween(String value1, String value2) {
            addCriterion("contact_web between", value1, value2, "contactWeb");
            return (Criteria) this;
        }

        public Criteria andContactWebNotBetween(String value1, String value2) {
            addCriterion("contact_web not between", value1, value2, "contactWeb");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}