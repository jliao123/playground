class InvitationMailer < MandrillMailer::TemplateMailer
  default from: 'g@sftip.com'

  def invite()
    # in this example `invitation.invitees` is an Array
    # invitees = invitation.invitees.map { |invitee| { email: invitee.email, name: invitee.name } }

    mandrill_mail(
      template: 'new-space',
      subject: 'New request for quote',
      to: 'jackieoliao@gmail.com',
        # to: invitation.email,
        # to: { email: invitation.email, name: 'Honored Guest' },
      vars: {
        'OWNER_NAME' => 'n/a',
        'PROJECT_NAME' => 'n/a'
      },
      important: true,
      inline_css: true,
      attachments: [
                    {
                      content: File.read(File.expand_path('pdfs/myfile.pdf')),
                      name: 'myfile.pdf',
                      type: 'application/pdf'
                    }
                  ],
     )
  end
end