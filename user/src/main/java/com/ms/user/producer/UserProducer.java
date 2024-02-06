package com.ms.user.producer;

import com.ms.email.dtos.EmailRecordDto;
import com.ms.user.model.UserModel;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.ms.email.consumer.EmailConsumer;
@Component
public class UserProducer {
    final RabbitTemplate rabbitTemplate;

    public UserProducer(RabbitTemplate rabbitTemplate){
        this.rabbitTemplate = rabbitTemplate;
    }

    @Value(value = "${broker.queue.email.name}")
    private String routingKey;

    public void publishMessageEmail(UserModel userModel){
        var emailDto = new EmailRecordDto();
        emailDto.setUserId(userModel.getUserId());
        emailDto.setEmailTo(userModel.getEmail());
        emailDto.setSubject("Cadastro Realizado!");
        emailDto.setText(userModel.getName()+", seja bem vinde!");

        rabbitTemplate.convertAndSend("",routingKey,emailDto);

        //Violando conectando diretamente como monolito
        EmailConsumer.ListenEmailQueue(emailDto);
    }

}
