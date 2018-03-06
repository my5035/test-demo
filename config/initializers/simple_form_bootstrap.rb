SimpleForm.setup do |config|

  config.input_class = 'form-control'

  #TODO find why customize wrapper not work in fields_for
  #config.wrappers :bootstrap, tag: 'div', class: 'form-group', error_class: 'error' do |b|
  #  b.use :html5
  #  b.use :placeholder
  #  b.use :label
  #  b.wrapper tag: 'div', class: 'controls' do |ba|
  #    ba.use :input
  #    ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
  #    ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  #  end
  #end

  config.wrappers :bootstrap, tag: 'div', class: 'form-group', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: "string optional control-label col-sm-2 control-label no-padding-right control-label no-padding-right"
    b.wrapper tag: 'div', class: 'col-sm-12 col-md-9 col-lg-9 col-xs-12' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :table_fields_for, tag: nil, error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    #b.wrapper tag: 'div', class: 'col-sm-12 col-md-9 col-lg-9 col-xs-12' do |ba|
      b.use :input, class: "col-2"
      b.use :error, wrap_with: { tag: 'span', class: 'help-inline black' }
      b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    #end
  end


  config.wrappers :prepend, tag: 'div', class: "form-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-prepend' do |prepend|
        prepend.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.wrappers :append, tag: 'div', class: "form-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-append' do |append|
        append.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.wrappers :horizontal, tag: 'div', class: "form-group", error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label,  class: "control-label no-padding-right"
    b.wrapper tag: 'div', class: 'col-sm-12 col-md-9 col-lg-9 col-xs-12' do |ba|
      ba.use :input, class: "col-xs-12 col-sm-12 col-md-10"
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-inline' }
    end
  end

  config.wrappers :checkbox, tag: :div, class: "checkbox", error_class: "has-error" do |b|

    # Form extensions
    b.use :html5

    # Form components
    b.wrapper tag: :label do |ba|
      ba.use :input
      ba.use :label_text
    end

    b.use :hint,  wrap_with: { tag: :p, class: "help-block" }
    b.use :error, wrap_with: { tag: :span, class: "help-block text-danger" }
  end

  config.default_wrapper = :bootstrap
end
